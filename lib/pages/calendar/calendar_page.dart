import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/notification/notification_bell.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/thoughts_service.dart';
import 'package:pacapaca/models/dto/thought_dto.dart';
import 'package:pacapaca/pages/calendar/thought_response_page.dart';
import 'package:pacapaca/providers/thoughts_provider.dart';
import 'package:uuid/uuid.dart';

// 미래 날짜인지 확인하는 유틸리티 함수
bool isFutureDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final compareDate = DateTime(date.year, date.month, date.day);
  return compareDate.isAfter(today);
}

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final now = DateTime.now();
    final firstDay = DateTime(now.year - 1, 1, 1);
    final lastDay = DateTime(now.year + 1, 12, 31);
    final selectedDay = ref.watch(selectedDateProvider);

    // 선택한 날짜의 생각 불러오기
    final selectedThoughtAsync =
        ref.watch(selectedThoughtProvider(selectedDay));

    // 모든 답변 기록 가져오기
    final answeredDatesAsync = ref.watch(thoughtsProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PageTitle(
        title: 'calendar.title'.tr(),
        hasBackButton: false,
        actions: const [
          NotificationBell(),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 캘린더 위젯
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Hero(
                tag: 'calendar_card',
                child: Material(
                  color: Colors.transparent,
                  child: Card(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: colorScheme.outline.withAlpha(30),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TableCalendar(
                        firstDay: firstDay,
                        lastDay: lastDay,
                        focusedDay: selectedDay,
                        currentDay: now,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, selectedDay),
                        onDaySelected: (selected, focused) {
                          ref.read(selectedDateProvider.notifier).state =
                              selected;
                        },
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: colorScheme.primary,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: colorScheme.primary,
                          ),
                          titleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: colorScheme.primary.withAlpha(150),
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: colorScheme.primary.withAlpha(50),
                            shape: BoxShape.circle,
                          ),
                          weekendTextStyle: TextStyle(
                            color: Colors.red.shade300,
                          ),
                          outsideDaysVisible: false,
                        ),
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, date, events) {
                            // 이미 선택된 날짜나 오늘 날짜가 아닌 경우에만 커스텀 스타일 적용
                            if (!isSameDay(date, selectedDay) &&
                                !isSameDay(date, now)) {
                              return answeredDatesAsync.when(
                                data: (thoughts) {
                                  final hasResponse = thoughts.any((thought) =>
                                      thought.isAnswered &&
                                      thought.date ==
                                          DateFormat('yyyy-MM-dd')
                                              .format(date));

                                  if (hasResponse) {
                                    // 답변이 있는 날짜는 primary 색상으로 배경 표시
                                    final isWeekend =
                                        date.weekday == DateTime.saturday ||
                                            date.weekday == DateTime.sunday;

                                    return Container(
                                      margin: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color:
                                            colorScheme.primary.withAlpha(80),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${date.day}',
                                          style: TextStyle(
                                            color: isWeekend
                                                ? Colors.red.shade300
                                                : colorScheme.onSurface,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  return null; // 기본 스타일 사용
                                },
                                loading: () => null,
                                error: (_, __) => null,
                              );
                            }

                            return null; // 기본 스타일 사용
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 따뜻한 한마디 카드
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: selectedThoughtAsync.when(
                data: (thought) {
                  // 생각이 없는 경우 해당 날짜의 생각을 새로 생성
                  if (thought == null) {
                    return FutureBuilder<ThoughtDTO>(
                      future: _createThoughtForDate(selectedDay),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return _buildLoadingCard(context);
                        }

                        if (snapshot.hasData) {
                          return _buildThoughtCard(
                            context,
                            snapshot.data!,
                            isSameDay(selectedDay, now),
                            ref,
                            selectedDay,
                          );
                        }

                        return _buildErrorCard(context, ref);
                      },
                    );
                  }

                  return _buildThoughtCard(
                    context,
                    thought,
                    isSameDay(selectedDay, now),
                    ref,
                    selectedDay,
                  );
                },
                loading: () => _buildLoadingCard(context),
                error: (error, stackTrace) {
                  print('Error: $error');
                  return _buildErrorCard(context, ref);
                },
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildThoughtCard(BuildContext context, ThoughtDTO thought,
      bool isToday, WidgetRef ref, DateTime date) {
    final colorScheme = Theme.of(context).colorScheme;

    return Hero(
      tag: 'thought_card_${thought.id}',
      child: Material(
        color: Colors.transparent,
        child: Card(
          margin: EdgeInsets.only(bottom: 16.h),
          elevation: 0.5,
          clipBehavior: Clip.antiAlias,
          color: colorScheme.primary.withAlpha(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: colorScheme.outline.withAlpha(30),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '오늘의 따뜻한 한마디',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    if (thought.isAnswered)
                      Icon(
                        Icons.check_circle,
                        color: colorScheme.primary.withAlpha(150),
                        size: 20.sp,
                      ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  thought.message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withAlpha(220),
                        height: 1.5,
                        fontSize: 16.sp,
                      ),
                ),
                SizedBox(height: 16.h),

                // 사용자 응답이 있는 경우 표시
                if (thought.response != null &&
                    thought.response!.isNotEmpty) ...[
                  Divider(color: colorScheme.outline.withAlpha(30)),
                  SizedBox(height: 8.h),
                  Text(
                    '나의 생각',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    thought.response!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withAlpha(200),
                          height: 1.5,
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  SizedBox(height: 8.h),
                ],

                // 하단 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      opacity: isFutureDate(date) ? 0.5 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: TextButton.icon(
                        onPressed: isFutureDate(date)
                            ? null // 미래 날짜는 비활성화
                            : () =>
                                _navigateToResponsePage(context, thought, ref),
                        icon: Icon(
                          thought.isAnswered ? Icons.edit : Icons.add,
                          size: 18.sp,
                        ),
                        label: Text(
                          thought.isAnswered ? '수정하기' : '답변 작성하기',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 0.5,
      clipBehavior: Clip.antiAlias,
      color: colorScheme.primary.withAlpha(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outline.withAlpha(30),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오늘의 따뜻한 한마디',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  color: colorScheme.primary,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 0.5,
      clipBehavior: Clip.antiAlias,
      color: colorScheme.primary.withAlpha(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outline.withAlpha(30),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오늘의 따뜻한 한마디',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 12.h),
            Text(
              '데이터를 불러오는 중 오류가 발생했습니다.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.error,
                    height: 1.5,
                    fontSize: 16.sp,
                  ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // 화면 새로고침
                    ref.refresh(selectedThoughtProvider(
                        ref.read(selectedDateProvider)));
                  },
                  icon: Icon(Icons.refresh, size: 18.sp),
                  label: Text('다시 시도', style: TextStyle(fontSize: 14.sp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToResponsePage(
      BuildContext context, ThoughtDTO thought, WidgetRef ref) {
    Navigator.of(context)
        .push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ThoughtResponsePage(thought: thought),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    )
        .then((_) {
      // 돌아오면 데이터 새로고침
      ref.refresh(selectedThoughtProvider(ref.read(selectedDateProvider)));
      ref.refresh(thoughtsProvider);
    });
  }

  // 특정 날짜에 대한 생각 생성 메서드
  Future<ThoughtDTO> _createThoughtForDate(DateTime date) async {
    final service = GetIt.instance<ThoughtsService>();
    final dateStr = DateTime(date.year, date.month, date.day)
        .toIso8601String()
        .split('T')[0];

    // 오늘 날짜인 경우 오늘의 생각 가져오기
    if (isSameDay(date, DateTime.now())) {
      return service.getTodayThought();
    }

    // 과거/미래 날짜인 경우 해당 날짜에 대한 생각 생성
    final thought = ThoughtDTO(
      id: const Uuid().v4(),
      message: await service.getRandomThoughtForDate(date),
      date: dateStr,
    );

    // 생성된 생각 저장
    await service.saveCustomThought(thought);

    return thought;
  }
}

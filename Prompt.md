개발 순서 참고

1. 클라이언트의 요청, 응답을 정하는 모델 생성 @lib/models/dto
2. 서버와 통신을 위한 service 생성 @lib/services
3. service에 대한 상태 관리를 위한 provider 생성 @lib/providers
4. 화면 구성을 위한 파일 생성 @lib/pages/{feature_name}
5. 공통으로 사용하는 위젯 생성시 widget 생성 @lib/widgets
6. 페이지 안에서만 사용하는 위젯 생성시 @lib/pages/{feature_name}/widgets
7. 라우터 추가가 필요한 경우 @lib/router.dart 에 추가

예시) 유저 차단 기능을 추가를 한다면..
- 서버코드를 먼저 참고하여 어떤 api 가 필요한지 확인
- @lib/models/dto/block_dto.dart 에 dto 추가
- @lib/services/block_service.dart 에 서비스 추가
- @lib/main.dart에 get_it 을 사용하여 service singleton 추가
- @lib/providers/block_provider.dart 에 provider 추가
- @lib/pages/block 에 페이지 추가
- @lib/pages/block/widgets 에 위젯 추가
- @lib/router.dart 에 라우터 추가

provider는 riverpod 3.0 버전을 사용하고 있습니다.
dto는 freezed 라이브러리를 사용하고 있습니다.
http 통신은 dio 라이브러리를 사용하고 있습니다.

--example--
서버 코드)
```go
package api

import (
	"sendmind-hub/internal/model"
	"time"
)

// Request
type RequestCreateUserBlock struct {
	ReportedID int64  `json:"reported_id"`
	Reason     string `json:"reason"`
	CommentID  int64  `json:"comment_id,omitempty"`
	ArticleID  int64  `json:"article_id,omitempty"`
}

// Response
type ResponseUserBlock struct {
	Block *UserBlockDTO `json:"block"`
}

type ResponseUserBlocks struct {
	Blocks []*UserBlockDTO `json:"blocks"`
}

// DTO
type UserBlockDTO struct {
	ID         int64     `json:"id"`
	ReporterID int64     `json:"reporter_id"`
	ReportedID int64     `json:"reported_id"`
	Reason     string    `json:"reason"`
	Status     string    `json:"status"`
	CommentID  int64     `json:"comment_id,omitempty"`
	ArticleID  int64     `json:"article_id,omitempty"`
	CreateTime time.Time `json:"create_time"`
	UpdateTime time.Time `json:"update_time"`
}
```
```go
	// Block 관련 라우트
	protected.HandleFunc("/blocks", blockHandler.HandleCreateBlock).Methods("POST")
	protected.HandleFunc("/blocks", blockHandler.HandleGetBlocks).Methods("GET")
	protected.HandleFunc("/blocks/{id}", blockHandler.HandleUnblock).Methods("PUT")

```

--작성해야할 코드--
@lib/models/dto/block_dto.dart
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_dto.freezed.dart';
part 'block_dto.g.dart';

@freezed
class RequestCreateUserBlock with _$RequestCreateUserBlock {
  const factory RequestCreateUserBlock({
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
  }) = _RequestCreateUserBlock;

  factory RequestCreateUserBlock.fromJson(Map<String, dynamic> json) =>
      _$RequestCreateUserBlockFromJson(json);
}

@freezed
class UserBlockDTO with _$UserBlockDTO {
  const factory UserBlockDTO({
    required int id,
    @JsonKey(name: 'reporter_id') required int reporterId,
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    required String status,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
    @JsonKey(name: 'create_time') required String createTime,
    @JsonKey(name: 'update_time') required String updateTime,
  }) = _UserBlockDTO;

  factory UserBlockDTO.fromJson(Map<String, dynamic> json) =>
      _$UserBlockDTOFromJson(json);
}

@freezed
class ResponseUserBlock with _$ResponseUserBlock {
  const factory ResponseUserBlock({
    required UserBlockDTO block,
  }) = _ResponseUserBlock;

  factory ResponseUserBlock.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserBlockFromJson(json);
}

@freezed
class ResponseUserBlocks with _$ResponseUserBlocks {
  const factory ResponseUserBlocks({
    List<UserBlockDTO>? blocks,
  }) = _ResponseUserBlocks;

  factory ResponseUserBlocks.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserBlocksFromJson(json);
}

```

@lib/services/block_service.dart
```dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class BlockService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 사용자 차단하기
  Future<UserBlockDTO?> createBlock(RequestCreateUserBlock request) async {
    try {
      final response = await _dio.post(
        '/v1/blocks',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final blockResponse =
            ResponseUserBlock.fromJson(responseRest.response!);
        return blockResponse.block;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('create block', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 차단 해제하기
  Future<void> unblock(int blockId) async {
    try {
      await _dio.put('/v1/blocks/$blockId');
    } catch (e, stackTrace) {
      logger.e('unblock user', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 차단 목록 조회하기
  Future<List<UserBlockDTO>?> getBlocks() async {
    try {
      final response = await _dio.get('/v1/blocks');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final blocksResponse =
            ResponseUserBlocks.fromJson(responseRest.response!);
        return blocksResponse.blocks;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get blocks', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

```

@lib/providers/block_provider.dart
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/services/block_service.dart';

part 'block_provider.g.dart';

@riverpod
class Blocks extends _$Blocks {
  final _blockService = GetIt.instance<BlockService>();

  @override
  Future<List<UserBlockDTO>> build() async {
    // 초기 차단 목록 로드
    final blocks = await _blockService.getBlocks();
    return blocks ?? [];
  }

  /// 사용자 차단하기
  Future<void> blockUser({
    required int userId,
    required String reason,
    int? commentId,
    int? articleId,
  }) async {
    final request = RequestCreateUserBlock(
      reportedId: userId,
      reason: reason,
      commentId: commentId,
      articleId: articleId,
    );

    final block = await _blockService.createBlock(request);
    if (block != null) {
      state = AsyncValue.data([...state.value ?? [], block]);
    }
  }

  /// 차단 해제하기
  Future<void> unblockUser(int blockId) async {
    await _blockService.unblock(blockId);
    state = AsyncValue.data(
      state.value?.where((block) => block.id != blockId).toList() ?? [],
    );
  }

  /// 차단한 사용자 목록 새로고침
  Future<void> refreshBlocks() async {
    state = const AsyncValue.loading();
    try {
      final blocks = await _blockService.getBlocks();
      state = AsyncValue.data(blocks ?? []);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

```

@lib/pages/block
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/page_title.dart';
class BlockedUsersPage extends ConsumerWidget {
  const BlockedUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockedUsers = ref.watch(blocksProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'block.list_title'.tr(),
        actions: [
          // 새로고침 버튼
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(blocksProvider.notifier).refreshBlocks();
            },
          ),
        ],
      ),
      body: blockedUsers.when(
        data: (users) {
          if (users.isEmpty) {
            return Center(
              child: Text(
                'block.no_blocks'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final block = users[index];
              return Dismissible(
                key: Key('block-${block.id}'),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).colorScheme.error,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('block.unblock'.tr()),
                          content: Text('block.unblock_confirm'.tr()),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('block.cancel'.tr()),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text(
                                'block.unblock'.tr(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ) ??
                      false;
                },
                onDismissed: (direction) {
                  ref.read(blocksProvider.notifier).unblockUser(block.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('block.unblocked'.tr()),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: ListTile(
                  title: Text(block.reason),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd HH:mm')
                            .format(DateTime.parse(block.createTime)),
                      ),
                      if (block.articleId != null)
                        Text('block.from_article'.tr()),
                      if (block.commentId != null)
                        Text('block.from_comment'.tr()),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('block.unblock'.tr()),
                          content: Text('block.unblock_confirm'.tr()),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('block.cancel'.tr()),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text(
                                'block.unblock'.tr(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );

                      if (confirmed == true) {
                        ref.read(blocksProvider.notifier).unblockUser(block.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('block.unblocked'.tr()),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: RotatingPacaLoader()),
        error: (error, stack) => Center(
          child: Text(
            'block.error_loading'.tr(args: [error.toString()]),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
    );
  }
}

```

@lib/pages/block/widgets
```dart
...
필요시 위젯 추가
...
```

@lib/router.dart
```dart
...
        GoRoute(
          path: '/settings/blocked-users',
          builder: (context, state) => const BlockedUsersPage(),
        ),
...
```

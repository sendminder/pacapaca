import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/services/dio_service.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';

class CommentService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  // 댓글 목록 조회
  Future<List<ArticleCommentDTO>?> getComments(int articleId) async {
    try {
      final response = await _dio.get('/v1/articles/$articleId/comments');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final commentsResponse =
            ResponseListComments.fromJson(responseRest.response!);
        return commentsResponse.comments;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get comments', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 댓글 목록 조회 paging 이용
  Future<List<ArticleCommentDTO>?> listComments(
    int articleId,
    int limit,
    int pagingKey,
    String? sortBy,
  ) async {
    try {
      final request = RequestListComments(
        sortBy: sortBy ?? 'latest',
        limit: limit,
        pagingKey: pagingKey,
      );

      final response = await _dio.get(
        '/v1/articles/$articleId/comments',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final commentsResponse =
            ResponseListComments.fromJson(responseRest.response!);
        return commentsResponse.comments;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('list comments', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 대댓글 목록 조회
  Future<List<ArticleCommentDTO>?> listReplies(
    int articleId,
    int commentId,
    int limit,
    int? pagingKey,
    String? sortBy,
  ) async {
    try {
      final request = RequestListReplies(
        sortBy: sortBy ?? 'latest',
        limit: limit,
        pagingKey: pagingKey,
      );

      final response = await _dio.get(
        '/v1/articles/$articleId/comments/$commentId/replies',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final repliesResponse =
            ResponseListComments.fromJson(responseRest.response!);
        return repliesResponse.comments;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('list replies', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 댓글 작성
  Future<ArticleCommentDTO?> createComment(
    int articleId,
    RequestCreateComment request,
  ) async {
    try {
      final response = await _dio.post(
        '/v1/articles/$articleId/comments',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        // 응답에서 단일 댓글 파싱
        final getCommentResponse =
            ResponseGetComment.fromJson(responseRest.response!);
        return getCommentResponse.comment;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('create comment', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 댓글 수정
  Future<ArticleCommentDTO?> updateComment(
    int articleId,
    int commentId,
    RequestUpdateComment request,
  ) async {
    try {
      final response = await _dio.put(
        '/v1/articles/$articleId/comments/$commentId',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final getCommentResponse =
            ResponseGetComment.fromJson(responseRest.response!);
        return getCommentResponse.comment;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('update comment', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 댓글 삭제
  Future<void> deleteComment(int articleId, int commentId) async {
    try {
      await _dio.delete('/v1/articles/$articleId/comments/$commentId');
    } catch (e, stackTrace) {
      logger.e('delete comment', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

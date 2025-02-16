import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';
import 'package:pacapaca/models/enums/article_category.dart';

class ArticleService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  // 게시글 목록 조회
  Future<List<ArticleDTO>?> getArticles({
    required String sortBy,
    required int limit,
    int? pagingViewCount,
    int? pagingArticleId,
    ArticleCategory? category,
  }) async {
    try {
      String categoryString = "";
      if (category != null && category != ArticleCategory.all) {
        categoryString = category.name;
      }

      final request = ListArticlesRequest(
        sortBy: sortBy,
        limit: limit,
        pagingViewCount: pagingViewCount,
        pagingArticleId: pagingArticleId,
        category: categoryString,
      );

      final response = await _dio.get(
        '/v1/articles',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final articlesResponse =
            ListArticlesResponse.fromJson(responseRest.response!);
        return articlesResponse.articles;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get articles', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 게시글 상세 조회
  Future<ArticleDTO?> getArticle(int articleId) async {
    try {
      final response = await _dio.get('/v1/articles/$articleId');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final articleResponse =
            GetArticleResponse.fromJson(responseRest.response!);
        return articleResponse.article;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get article', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 게시글 작성
  Future<ArticleDTO?> createArticle(CreateArticleRequest request) async {
    try {
      final response = await _dio.post(
        '/v1/articles',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final articleResponse =
            GetArticleResponse.fromJson(responseRest.response!);
        return articleResponse.article;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('create article', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 게시글 수정
  Future<ArticleDTO?> updateArticle(
    int articleId,
    UpdateArticleRequest request,
  ) async {
    try {
      final response = await _dio.put(
        '/v1/articles/$articleId',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final articleResponse =
            GetArticleResponse.fromJson(responseRest.response!);
        return articleResponse.article;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('update article', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 게시글 삭제
  Future<void> deleteArticle(int articleId) async {
    try {
      await _dio.delete('/v1/articles/$articleId');
    } catch (e, stackTrace) {
      logger.e('delete article', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

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
            ArticleCommentsResponse.fromJson(responseRest.response!);
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
      final response = await _dio.get(
        '/v1/articles/$articleId/comments',
        queryParameters: {
          'limit': limit,
          'paging_key': pagingKey,
          'sort_by': sortBy,
        },
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final commentsResponse =
            ArticleCommentsResponse.fromJson(responseRest.response!);
        return commentsResponse.comments;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('list comments', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 댓글 작성
  Future<ArticleCommentDTO?> createComment(
    int articleId,
    CreateCommentRequest request,
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
            GetCommentResponse.fromJson(responseRest.response!);
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
    UpdateCommentRequest request,
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
            GetCommentResponse.fromJson(responseRest.response!);
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

  // 좋아요 추가
  Future<ArticleLikeResponse?> toggleArticleLike(int articleId) async {
    try {
      final response = await _dio.post('/v1/articles/$articleId/like');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final articleResponse =
            ArticleLikeResponse.fromJson(responseRest.response!);
        return articleResponse;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('toggle like', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

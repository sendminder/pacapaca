import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'dart:convert';

class ArticleService {
  late final Dio _dio;
  final StorageService _storageService = GetIt.instance<StorageService>();
  final logger = GetIt.instance<Logger>();

  ArticleService() {
    _dio = Dio(BaseOptions(
      baseUrl: dotenv.get('SENDMIND_API_URL'),
      headers: {'Content-Type': 'application/json'},
    ));
  }

  // 게시글 목록 조회
  Future<List<ArticleDTO>?> getArticles({
    required String sortBy,
    required int limit,
    int? pagingKey,
    String? category,
  }) async {
    try {
      final request = ListArticlesRequest(
        sortBy: sortBy,
        limit: limit,
        pagingKey: pagingKey,
        category: category,
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
      final token = await _storageService.accessToken;
      if (token == null) throw Exception('No access token');

      final response = await _dio.post(
        '/v1/articles',
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
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
      final token = await _storageService.accessToken;
      if (token == null) throw Exception('No access token');

      final response = await _dio.put(
        '/v1/articles/$articleId',
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
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
      final token = await _storageService.accessToken;
      if (token == null) throw Exception('No access token');

      await _dio.delete(
        '/v1/articles/$articleId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
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

  // 댓글 작성
  Future<ArticleCommentDTO?> createComment(
    int articleId,
    CreateCommentRequest request,
  ) async {
    try {
      final token = await _storageService.accessToken;
      if (token == null) throw Exception('No access token');

      final response = await _dio.post(
        '/v1/articles/$articleId/comments',
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        // 응답에서 단일 댓글 파싱
        return ArticleCommentDTO.fromJson(responseRest.response!);
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
      final token = await _storageService.accessToken;
      if (token == null) throw Exception('No access token');

      final response = await _dio.put(
        '/v1/articles/$articleId/comments/$commentId',
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return ArticleCommentDTO.fromJson(responseRest.response!);
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
      final token = await _storageService.accessToken;
      if (token == null) throw Exception('No access token');

      await _dio.delete(
        '/v1/articles/$articleId/comments/$commentId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e, stackTrace) {
      logger.e('delete comment', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

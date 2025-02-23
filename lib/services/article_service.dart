import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/services/dio_service.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'dart:convert';

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

      final request = RequestListArticles(
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
            ResponseListArticles.fromJson(responseRest.response!);
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
            ResponseGetArticle.fromJson(responseRest.response!);
        return articleResponse.article;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get article', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 게시글 작성
  Future<ArticleDTO?> createArticle(RequestCreateArticle request) async {
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
            ResponseGetArticle.fromJson(responseRest.response!);
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
    RequestUpdateArticle request,
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
            ResponseGetArticle.fromJson(responseRest.response!);
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

  // 좋아요 추가
  Future<ResponseArticleLike?> toggleArticleLike(int articleId) async {
    try {
      final response = await _dio.post('/v1/articles/$articleId/like');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final articleResponse =
            ResponseArticleLike.fromJson(responseRest.response!);
        return articleResponse;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('toggle like', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 게시글 검색
  Future<List<ArticleDTO>?> searchArticles({
    required String query,
    required int limit,
    int? pagingKey,
  }) async {
    try {
      final request = RequestSearchArticles(
        query: query,
        limit: limit,
        pagingKey: pagingKey,
      );

      final response = await _dio.get(
        '/v1/articles/search',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final searchResponse =
            ResponseListArticles.fromJson(responseRest.response!);
        return searchResponse.articles;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('search articles', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

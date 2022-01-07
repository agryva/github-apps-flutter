
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_apps/domain/models/body/repository_body.dart';
import 'package:github_apps/domain/models/body/issues_body.dart';
import 'package:github_apps/domain/models/body/user_body.dart';
import 'package:github_apps/domain/models/utils/ExceptionsCustom.dart';
import 'package:github_apps/repository/github_repository_impl.dart';

class GithubRepository extends GithubRepositoryImpl {
  final Dio dio;

  GithubRepository(this.dio);

  @override
  getUserData(int page, String search) async {
    try {
      final response = await dio.get("/search/users",
          queryParameters: {
            "page": page,
            'q': search,
            'per_page': 10,
          }
      );
      if (response.data != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return ResponseUserBody.fromJson(response.data);
        } else {
          throw ExceptionsCustom("Unidentified");
        }
      } else {
        throw ExceptionsCustom("Unidentified");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        String responseError = "Something went wrong";
        if (e.response?.data != null) {
          if (e.response?.data is String) {
            responseError = e.response?.data ?? "Something went wrong";
          } else {
            responseError = json.decode(json.encode(e.response?.data))['message'];
          }
        }
        if (responseError.toString().toLowerCase().contains("invalid or expired jwt")) {
          // throw UnAuthorizeException("UnAuthorized Token");
        } else {
          throw ExceptionsCustom(responseError);
        }
      } else {
        throw ExceptionsCustom("Something went wrong");
      }
    }
  }

  @override
  getIssuesData(int page, String search) async {
    try {
      final response = await dio.get("/search/issues",
          queryParameters: {
            "page": page,
            'q': search,
            'per_page': 10,
          }
      );
      if (response.data != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return ResponseIssuesBody.fromJson(response.data);
        } else {
          throw ExceptionsCustom("Unidentified");
        }
      } else {
        throw ExceptionsCustom("Unidentified");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        String responseError = "Something went wrong";
        if (e.response?.data != null) {
          if (e.response?.data is String) {
            responseError = e.response?.data ?? "Something went wrong";
          } else {
            responseError = json.decode(json.encode(e.response?.data))['message'];
          }
        }
        if (responseError.toString().toLowerCase().contains("invalid or expired jwt")) {
          // throw UnAuthorizeException("UnAuthorized Token");
        } else {
          throw ExceptionsCustom(responseError);
        }
      } else {
        throw ExceptionsCustom("Something went wrong");
      }
    }
  }

  @override
  getRepositoriesData(int page, String search) async {
    try {
      final response = await dio.get("/search/repositories",
          queryParameters: {
            "page": page,
            'q': search,
            'per_page': 10,
          }
      );
      if (response.data != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return ResponseRepositoryBody.fromJson(response.data);
        } else {
          throw ExceptionsCustom("Unidentified");
        }
      } else {
        throw ExceptionsCustom("Unidentified");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        String responseError = "Something went wrong";
        if (e.response?.data != null) {
          if (e.response?.data is String) {
            responseError = e.response?.data ?? "Something went wrong";
          } else {
            responseError = json.decode(json.encode(e.response?.data))['message'];
          }
        }
        if (responseError.toString().toLowerCase().contains("invalid or expired jwt")) {
          // throw UnAuthorizeException("UnAuthorized Token");
        } else {
          throw ExceptionsCustom(responseError);
        }
      } else {
        throw ExceptionsCustom("Something went wrong");
      }
    }
  }
}
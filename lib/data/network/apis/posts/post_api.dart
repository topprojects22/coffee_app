import 'dart:async';
import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:dio/src/response.dart';

class PostApi {
  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  //TODO ХЗ что это, я закоментил по 28 строку
  /// Returns list of post in response
  // Future<PostList> getPosts() async {
  //   try {
  //     final Response res = await _dioClient.dio.get(Endpoints.getPosts);
  //     return PostList.fromJson(res.data);
  //   } catch (e) {
  //     print(e.toString());
  //     rethrow;
  //   }
  // }

  /// sample api call with default rest client
//   Future<PostList> getPosts() async {
//     try {
//       final res = await _restClient.get(Endpoints.getPosts);
//       return PostList.fromJson(res.data);
//     } catch (e) {
//       print(e.toString());
//       throw e;
//     }
//   }
}

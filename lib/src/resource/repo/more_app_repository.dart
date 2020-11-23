import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lichamduong/src/configs/configs.dart';
import 'package:lichamduong/src/resource/model/more_app.dart';
import 'package:lichamduong/src/utils/app_clients.dart';

class MoreAppRepository {
  http.Client client = http.Client();
  String _apiUrl = AppEndpoint.MORE_APPS;

  Future<List<MoreApp>> fetchMoreAppList() async {
    final apps = <MoreApp>[];
    try {
      Map<String, dynamic> params = {
        "os": Platform.isAndroid ? "android" : "ios"
      };
      final response = await AppClients().get(_apiUrl, queryParameters: params);
      List.from(jsonDecode(response.data)['apps']).forEach((element) {
        apps.add(MoreApp.fromJson(element));
      });
    } on DioError catch (e) {
      print(e.error);
    }
    print(apps);
    return apps;
  }
}

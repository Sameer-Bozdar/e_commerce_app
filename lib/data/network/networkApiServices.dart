import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'baseApiService.dart';

class NetworkApiServices extends BaseApiServices {
  List storeList = [];

  @override
  Future<dynamic> getGetApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));

      print(
          '${response.statusCode}response===================================================fffffffffwwwwwwwqqqqqqqq---00');
      print(
          '${response.body}response===================================================fffffffffwwwwwwwqqqqqqqq---00');

      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(response.body);
        for (Map i in responseJson) {
          storeList.add(i);
          // return storeList;
        }

        return storeList;
      }
    } on SocketException {
      print('No Internet Connection');
    }
    return [];
  }
}

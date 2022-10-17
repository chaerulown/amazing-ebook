import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiRequest{
  String baseUrl = 'https://api.itbook.store/1.0/';
  ApiRequest();

  Future<List?> getListBook() async {
    try{
      final Dio _dio = Dio()..options.baseUrl = this.baseUrl;
      var resp = await _dio.get('new');
      debugPrint('hasil => '+resp.data.toString());
      if(resp.data['books'] is List){
        return resp.data['books'];
      }else{
        return null;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }
}
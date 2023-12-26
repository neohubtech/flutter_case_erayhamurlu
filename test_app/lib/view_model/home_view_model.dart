import 'package:flutter/material.dart';
import 'package:test_app/const/text_const.dart';
import 'package:test_app/service/api.dart';

import '../model/home_data_model.dart';

class HomeViewModel {
  //Get the home data from the API
  Future<HomeData> getHomeData() async {
    var data = await Api.request(url: url);
    debugPrint(data.toString());
    return HomeData.fromJson(data);
  }
}

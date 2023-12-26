import 'package:flutter/material.dart';
import 'package:test_app/model/combined_model.dart';

import 'banner_model.dart';

const String bannerListText = 'bannerList';
const String combinedListText = 'combinedList';

//We keep the data in a separate file to make it easier to change the data in the app.
class HomeData {
  List<BannerModel> bannerList;
  List<CombinedModel> combinedList;

  HomeData(this.bannerList, this.combinedList);

  factory HomeData.fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());
    var bannerList = json[bannerListText] == null ? [] : json[bannerListText] as List;
    var combinedList = json[combinedListText] == null ? [] : json[combinedListText] as List;

    return HomeData(
      bannerList.map((i) => BannerModel.fromJson(i)).toList(),
      combinedList.map((i) => CombinedModel.fromJson(i)).toList(),
    );
  }
}

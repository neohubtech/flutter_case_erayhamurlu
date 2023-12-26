const String imageUrlText = 'imageUrl';
const String nameText = 'name';

class BannerModel {
  String imageUrl;
  String name;

  BannerModel(this.imageUrl, this.name);

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      json[imageUrlText],
      json[nameText],
    );
  }
}

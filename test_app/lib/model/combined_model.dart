const String imageUrlText = 'imageUrl';
const String typeText = 'type';
const String nameText = 'name';
const String explanationText = 'explanation';

class CombinedModel {
  String imageUrl;
  String type;
  String name;
  String explanation;

  CombinedModel(this.imageUrl, this.type, this.name, this.explanation);

  factory CombinedModel.fromJson(Map<String, dynamic> json) {
    return CombinedModel(
      json[imageUrlText],
      json[typeText],
      json[nameText],
      json[explanationText],
    );
  }
}

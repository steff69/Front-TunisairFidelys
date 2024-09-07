class CategoryModel {
  int result;
  List<DatumC> data;

  CategoryModel({
    required this.result,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        result: json["Result"],
        data: List<DatumC>.from(json["data"].map((x) => DatumC.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumC {
  String id;
  String title;
  String value;
  String imageUrl;

  DatumC({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  factory DatumC.fromJson(Map<String, dynamic> json) => DatumC(
        id: json["_id"],
        title: json["title"],
        value: json["value"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "value": value,
        "imageUrl": imageUrl,
      };
}

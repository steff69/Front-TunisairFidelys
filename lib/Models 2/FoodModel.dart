class FoodModel {
  int result;
  List<Datum> data;

  FoodModel({
    required this.result,
    required this.data,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        result: json["Result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Object? get title => null;

  Map<String, dynamic> toJson() => {
        "Result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String name;
  String image;
  String description;

  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "description": description,
      };
}

class Additive {
  int id;
  String title;
  String price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
      };
}

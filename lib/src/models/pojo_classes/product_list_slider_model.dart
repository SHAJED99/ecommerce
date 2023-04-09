class ProductListSliderModel {
  late String id;
  late String title;
  late String shortDes;
  late String image;

  ProductListSliderModel({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.image,
  });

  ProductListSliderModel.fromJson(Map<String, dynamic> json) {
    id = (json['id'] ?? "").toString();
    title = json['title'] ?? "";
    shortDes = json['short_des'] ?? "";
    image = json['image'] ?? "";
  }
}

class CategoryModel {
  late String id;
  late String categoryName;
  late String categoryImg;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = (json['id'] ?? "").toString();
    categoryName = json['categoryName'] ?? "";
    categoryImg = json['categoryImg'] ?? "";
  }
}

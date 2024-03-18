class CategoryModel {
  String category;
  String image;
  String description;
  CategoryModel({
    required this.category,
    required this.image,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category: json['strCategory'],
      image: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}

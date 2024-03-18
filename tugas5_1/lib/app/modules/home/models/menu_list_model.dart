class MenuListModel {
  final String image;

  final String title;

  MenuListModel({
    required this.title,
    required this.image,
  });

  factory MenuListModel.fromJson(Map<String, dynamic> json) {
    return MenuListModel(
      image: json['strMealThumb'],
      title: json['strMeal'],
    );
  }
}

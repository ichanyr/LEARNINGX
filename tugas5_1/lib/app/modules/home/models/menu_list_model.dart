class FilterModel {
  final String image;
  final String title;

  FilterModel({
    required this.title,
    required this.image,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      image: json['strMealThumb'],
      title: json['strMeal'],
    );
  }
}

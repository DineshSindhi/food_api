class RecipesModel {
  int? id;
  int? caloriesPerServing;
  int? cookTimeMinutes;
  int? prepTimeMinutes;
  num? rating;
  int? reviewCount;
  int? servings;
  int? userId;
  List<dynamic>?ingredients;
  List<dynamic>?instructions;
  List<dynamic>?mealType;
  List<dynamic>?tags;
  String? cuisine;
  String? difficulty;
  String? image;
  String? name;

  RecipesModel({
    required this.id,
    required this.caloriesPerServing,
    required this.cookTimeMinutes,
    required this.prepTimeMinutes,
    required this.rating,
    required this.reviewCount,
    required this.servings,
    required this.userId,
    required this.ingredients,
    required this.instructions,
    required this.mealType,
    required this.tags,
    required this.cuisine,
    required this.difficulty,
    required this.image,
    required this.name});

  factory RecipesModel.fromJson(Map<String, dynamic> json){
    return RecipesModel(
        id: json['id'],
        caloriesPerServing: json['caloriesPerServing'],
        cookTimeMinutes: json['cookTimeMinutes'],
        prepTimeMinutes: json['prepTimeMinutes'],
        rating: json['rating'],
        reviewCount: json['reviewCount'],
        servings: json['servings'],
        userId: json['userId'],
        ingredients: json['ingredients'],
        instructions: json['instructions'],
        mealType: json['mealType'],
        tags: json['tags'],
        cuisine: json['cuisine'],
        difficulty: json['difficulty'],
        image: json['image'],
        name: json['name']);
  }
}
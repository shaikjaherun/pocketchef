class RecipeModel {
  final String name;
  final String emoji;
  final String description;
  final String cookingTime;
  final double rating;

  final List<String> ingredients;
  final List<String> instructions;

  RecipeModel({
    required this.name,
    required this.emoji,
    required this.description,
    required this.cookingTime,
    required this.rating,
    required this.ingredients,
    required this.instructions,
  });
}
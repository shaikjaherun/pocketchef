import 'package:flutter/material.dart';

import '../data/recipe_data.dart';
import '../models/recipe_model.dart';
import '../widgets/recipe_card.dart';
import 'recipe_details_screen.dart';

class RecipeScreen extends StatelessWidget {
  final List<String> selectedIngredients;

  const RecipeScreen({
    super.key,
    required this.selectedIngredients,
  });

  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> recipes =
        RecipeData.findRecipes(selectedIngredients);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8A00),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Recommended Recipes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Heading
              const Text(
                'Your Recipe Suggestions 🍳',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Based on the ingredients you selected',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 18),

              // Selected ingredients
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedIngredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE7CC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        selectedIngredients[index],
                        style: const TextStyle(
                          color: Color(0xFFE66F00),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 22),

              // Recipe count
              Text(
                '${recipes.length} recipe${recipes.length == 1 ? '' : 's'} found',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF444444),
                ),
              ),

              const SizedBox(height: 14),

              // Recipe list
              Expanded(
                child: recipes.isEmpty
                    ? _buildNoRecipesMessage(context)
                    : ListView.builder(
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];

                          return RecipeCard(
                            recipe: recipe,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailsScreen(
                                    recipe: recipe,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoRecipesMessage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '😕',
            style: TextStyle(
              fontSize: 60,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'No recipes found',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Try selecting some different ingredients.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 25),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF8A00),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Choose Ingredients',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
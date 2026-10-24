import '../models/recipe_model.dart';

class RecipeData {
  static final List<RecipeModel> recipes = [

    // ==================================================
    // 1. SPICY TOMATO OMELETTE
    // ==================================================

    RecipeModel(
      name: 'Spicy Tomato Omelette',
      emoji: '🍳',
      description:
          'A delicious and spicy omelette made with fresh tomato, onion and chilli.',
      cookingTime: '15 min',
      rating: 4.8,

      ingredients: [
        'Egg',
        'Tomato',
        'Onion',
        'Chilli',
        'Salt',
        'Oil',
      ],

      instructions: [
        'Crack the eggs into a bowl and beat them well.',
        'Finely chop the tomato, onion and chilli.',
        'Heat a pan and add a little oil.',
        'Add the chopped vegetables and sauté for 2–3 minutes.',
        'Pour the beaten eggs into the pan.',
        'Add salt and cook both sides until golden.',
        'Serve hot.',
      ],
    ),

    // ==================================================
    // 2. TOMATO ONION CURRY
    // ==================================================

    RecipeModel(
      name: 'Tomato Onion Curry',
      emoji: '🍅',
      description:
          'A simple and tasty tomato onion curry that goes perfectly with rice or roti.',
      cookingTime: '25 min',
      rating: 4.6,

      ingredients: [
        'Tomato',
        'Onion',
        'Chilli',
        'Salt',
        'Oil',
        'Spices',
      ],

      instructions: [
        'Wash and chop the tomatoes and onions.',
        'Heat oil in a pan.',
        'Add the chopped onions and cook until soft.',
        'Add chilli and cook for another minute.',
        'Add chopped tomatoes and mix well.',
        'Add salt and your preferred spices.',
        'Cover and cook until the tomatoes become soft.',
        'Serve hot with rice or roti.',
      ],
    ),

    // ==================================================
    // 3. MASALA EGG BHURJI
    // ==================================================

    RecipeModel(
      name: 'Masala Egg Bhurji',
      emoji: '🌶️',
      description:
          'Spicy scrambled eggs cooked with onion, tomato and green chilli.',
      cookingTime: '20 min',
      rating: 4.9,

      ingredients: [
        'Egg',
        'Onion',
        'Tomato',
        'Chilli',
        'Salt',
        'Oil',
      ],

      instructions: [
        'Beat the eggs in a bowl.',
        'Chop onion, tomato and chilli.',
        'Heat oil in a pan.',
        'Add onion and sauté until golden.',
        'Add tomato and chilli.',
        'Cook until the tomato becomes soft.',
        'Add the beaten eggs and salt.',
        'Mix continuously until the eggs are cooked.',
        'Serve hot.',
      ],
    ),

    // ==================================================
    // 4. MASALA POTATO FRY
    // ==================================================

    RecipeModel(
      name: 'Masala Potato Fry',
      emoji: '🥔',
      description:
          'Crispy and flavorful potato fry prepared with onion and Indian spices.',
      cookingTime: '25 min',
      rating: 4.7,

      ingredients: [
        'Potato',
        'Onion',
        'Chilli',
        'Salt',
        'Oil',
        'Spices',
      ],

      instructions: [
        'Wash, peel and cut the potatoes into small pieces.',
        'Chop the onion and chilli.',
        'Heat oil in a pan.',
        'Add onion and sauté until soft.',
        'Add the potatoes and mix well.',
        'Add salt and spices.',
        'Cover and cook until the potatoes become soft.',
        'Cook uncovered for a few more minutes until crispy.',
        'Serve hot.',
      ],
    ),

    // ==================================================
    // 5. CARROT POTATO STIR FRY
    // ==================================================

    RecipeModel(
      name: 'Carrot Potato Stir Fry',
      emoji: '🥕',
      description:
          'A healthy and tasty vegetable stir fry made with carrot and potato.',
      cookingTime: '20 min',
      rating: 4.5,

      ingredients: [
        'Carrot',
        'Potato',
        'Onion',
        'Salt',
        'Oil',
        'Spices',
      ],

      instructions: [
        'Wash and peel the carrot and potato.',
        'Cut them into small pieces.',
        'Heat oil in a pan.',
        'Add chopped onion and sauté.',
        'Add carrot and potato.',
        'Add salt and spices.',
        'Cover and cook until the vegetables become tender.',
        'Stir occasionally.',
        'Serve hot.',
      ],
    ),

    // ==================================================
    // 6. CLASSIC EGG OMELETTE
    // ==================================================

    RecipeModel(
      name: 'Classic Egg Omelette',
      emoji: '🥚',
      description:
          'A quick and easy fluffy egg omelette perfect for breakfast.',
      cookingTime: '10 min',
      rating: 4.6,

      ingredients: [
        'Egg',
        'Salt',
        'Oil',
      ],

      instructions: [
        'Crack the eggs into a bowl.',
        'Beat the eggs until smooth.',
        'Add a pinch of salt.',
        'Heat a pan and add a little oil.',
        'Pour the eggs into the pan.',
        'Cook both sides until fully cooked.',
        'Serve immediately.',
      ],
    ),

    // ==================================================
    // 7. TOMATO SOUP
    // ==================================================

    RecipeModel(
      name: 'Fresh Tomato Soup',
      emoji: '🍅',
      description:
          'Warm and comforting homemade tomato soup made with fresh tomatoes.',
      cookingTime: '20 min',
      rating: 4.5,

      ingredients: [
        'Tomato',
        'Onion',
        'Salt',
        'Spices',
      ],

      instructions: [
        'Wash and chop the tomatoes and onion.',
        'Cook them in a pan until soft.',
        'Allow the mixture to cool slightly.',
        'Blend until smooth.',
        'Pour the mixture back into the pan.',
        'Add salt and spices.',
        'Simmer for a few minutes.',
        'Serve hot.',
      ],
    ),
  ];

  // ==================================================
  // FIND MATCHING RECIPES
  // ==================================================

  static List<RecipeModel> findRecipes(
    List<String> selectedIngredients,
  ) {

    final selected =
        selectedIngredients.map(
          (ingredient) => ingredient.toLowerCase(),
        ).toSet();

    final List<RecipeModel> matchingRecipes = [];

    for (final recipe in recipes) {

      final recipeIngredients =
          recipe.ingredients.map(
            (ingredient) => ingredient.toLowerCase(),
          ).toSet();

      // Count matching ingredients
      final matchingCount =
          selected.intersection(recipeIngredients).length;

      if (matchingCount > 0) {
        matchingRecipes.add(recipe);
      }
    }

    // Sort recipes by number of matching ingredients
    matchingRecipes.sort((a, b) {

      final aIngredients =
          a.ingredients.map(
            (ingredient) => ingredient.toLowerCase(),
          ).toSet();

      final bIngredients =
          b.ingredients.map(
            (ingredient) => ingredient.toLowerCase(),
          ).toSet();

      final aMatches =
          selected.intersection(aIngredients).length;

      final bMatches =
          selected.intersection(bIngredients).length;

      return bMatches.compareTo(aMatches);
    });

    return matchingRecipes;
  }
}
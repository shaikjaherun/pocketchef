import 'package:flutter/material.dart';

import '../widgets/ingredient_card.dart';
import 'recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> selectedIngredients = {};

  final TextEditingController searchController =
      TextEditingController();

  String searchText = '';

  final List<Map<String, String>> ingredients = [
    {'name': 'Tomato', 'emoji': '🍅'},
    {'name': 'Egg', 'emoji': '🥚'},
    {'name': 'Onion', 'emoji': '🧅'},
    {'name': 'Potato', 'emoji': '🥔'},
    {'name': 'Carrot', 'emoji': '🥕'},
    {'name': 'Chilli', 'emoji': '🌶️'},
    {'name': 'Garlic', 'emoji': '🧄'},
    {'name': 'Ginger', 'emoji': '🫚'},
    {'name': 'Capsicum', 'emoji': '🫑'},
    {'name': 'Spinach', 'emoji': '🥬'},
    {'name': 'Paneer', 'emoji': '🧀'},
    {'name': 'Chicken', 'emoji': '🍗'},
    {'name': 'Rice', 'emoji': '🍚'},
    {'name': 'Milk', 'emoji': '🥛'},
    {'name': 'Cheese', 'emoji': '🧀'},
    {'name': 'Mushroom', 'emoji': '🍄'},
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void toggleIngredient(String ingredient) {
    setState(() {
      if (selectedIngredients.contains(ingredient)) {
        selectedIngredients.remove(ingredient);
      } else {
        selectedIngredients.add(ingredient);
      }
    });
  }

  void searchIngredients(String value) {
    setState(() {
      searchText = value.trim().toLowerCase();
    });
  }

  void clearSearch() {
    searchController.clear();

    setState(() {
      searchText = '';
    });
  }

  void findRecipes() {
    if (selectedIngredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select at least one ingredient 🍳',
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeScreen(
          selectedIngredients: selectedIngredients.toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter ingredients according to search text
    final List<Map<String, String>> filteredIngredients =
        ingredients.where((ingredient) {
      final name = ingredient['name']!.toLowerCase();

      return name.contains(searchText);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),

      body: SafeArea(
        child: Column(
          children: [
            // ------------------------------------------------
            // HEADER
            // ------------------------------------------------
            Padding(
              padding: const EdgeInsets.fromLTRB(
                22,
                18,
                22,
                12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Chef! 👋',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          'What are we cooking?',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE7CC),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Text(
                        '👨‍🍳',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ------------------------------------------------
            // SEARCH BAR
            // ------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Container(
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,

                  // THIS MAKES SEARCH WORK
                  onChanged: searchIngredients,

                  decoration: InputDecoration(
                    hintText: 'Search ingredients...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),

                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFFFF8A00),
                      size: 27,
                    ),

                    // Clear button
                    suffixIcon: searchText.isNotEmpty
                        ? IconButton(
                            onPressed: clearSearch,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                          )
                        : null,

                    border: InputBorder.none,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            // ------------------------------------------------
            // TITLE
            // ------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Row(
                children: [
                  const Text(
                    'Choose Ingredients',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),

                  const Spacer(),

                  if (searchText.isNotEmpty)
                    Text(
                      '${filteredIngredients.length} found',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFFF8A00),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ------------------------------------------------
            // INGREDIENT GRID
            // ------------------------------------------------
            Expanded(
              child: filteredIngredients.isEmpty
                  ? _buildNoResults()
                  : LayoutBuilder(
                      builder: (
                        context,
                        constraints,
                      ) {
                        int columns = 2;

                        if (constraints.maxWidth >= 1200) {
                          columns = 4;
                        } else if (
                            constraints.maxWidth >= 700) {
                          columns = 3;
                        }

                        return GridView.builder(
                          padding:
                              const EdgeInsets.fromLTRB(
                            22,
                            0,
                            22,
                            110,
                          ),
                          itemCount:
                              filteredIngredients.length,

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 1.35,
                          ),

                          itemBuilder: (
                            context,
                            index,
                          ) {
                            final ingredient =
                                filteredIngredients[index];

                            final String name =
                                ingredient['name']!;

                            return IngredientCard(
                              emoji: ingredient['emoji']!,
                              name: name,
                              isSelected:
                                  selectedIngredients
                                      .contains(name),
                              onTap: () {
                                toggleIngredient(name);
                              },
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // ------------------------------------------------
      // FIND RECIPES BUTTON
      // ------------------------------------------------
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            22,
            8,
            22,
            12,
          ),
          child: SizedBox(
            height: 58,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: findRecipes,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8A00),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              child: Text(
                selectedIngredients.isEmpty
                    ? 'Find Recipes 🔍'
                    : 'Find Recipes '
                        '(${selectedIngredients.length}) 🔍',

                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------
  // NO SEARCH RESULTS
  // ------------------------------------------------
  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🔍',
            style: TextStyle(
              fontSize: 55,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'No ingredient found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Try searching for another ingredient.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
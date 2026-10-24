import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String emoji;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const IngredientCard({
    super.key,
    required this.emoji,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFE7CC)
              : Colors.white,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF8A00)
                : Colors.transparent,
            width: 2,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Stack(
          children: [

            // Ingredient
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    emoji,
                    style: const TextStyle(
                      fontSize: 45,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Selection check
            if (isSelected)
              Positioned(
                top: 12,
                right: 12,

                child: Container(
                  width: 28,
                  height: 28,

                  decoration: const BoxDecoration(
                    color: Color(0xFFFF8A00),
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
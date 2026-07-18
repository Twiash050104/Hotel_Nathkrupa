import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryBar({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];

          return ChoiceChip(
            label: Text(
              category,
              style: TextStyle(
                color: selectedCategory == category
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            selected: selectedCategory == category,
            selectedColor: Colors.orange,
            backgroundColor: Colors.grey.shade900,
            side: BorderSide(
              color: selectedCategory == category
                  ? Colors.orange
                  : Colors.white24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onSelected: (_) => onCategorySelected(category),
          );
        },
      ),
    );
  }
}

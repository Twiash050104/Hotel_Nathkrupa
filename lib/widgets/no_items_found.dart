import 'package:flutter/material.dart';

class NoItemsFound extends StatelessWidget {
  final String searchText;

  const NoItemsFound({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 70,
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            const Text(
              "No items found",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'No menu item matches "$searchText".',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 17),
            ),

            const SizedBox(height: 25),

            const Text(
              "• Check the spelling\n"
              "• Try another keyword\n"
              "• Browse using the categories above",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

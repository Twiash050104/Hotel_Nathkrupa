import 'package:flutter/material.dart';
import 'package:nathkrupa/social/social_links.dart';
import 'package:nathkrupa/widgets/header.dart';
import 'package:nathkrupa/widgets/items.dart';
import '../widgets/search_bar.dart';
import '../widgets/veg_toggle.dart';
import '../widgets/category_chips.dart';
import '../widgets/starter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";
  String selectedType = "all";
  String selectedCategory = "All";

  final List<String> vegcategories = [
    "All",
    "Main Course",
    "Rice Specials",
    "Combo Thali",
    "Veg Handi Full",
    "Bread",
  ];
  final List<String> nonvegcategories = [
    "All",
    "Non-Veg Thali",
    "Non-Veg Chicken",
    "Non-Veg Biryani",
    "Non-Veg Rice",
    "Fish",
    "Egg",
  ];
  final List<String> allcategories = [
    "All",
    "Main Course",
    "Rice Specials",
    "Combo Thali",
    "Veg Handi Full",
    "Bread",
    "Non-Veg Thali",
    "Non-Veg Chicken",
    "Non-Veg Biryani",
    "Fish",
    "Egg",
  ];

  @override
  Widget build(BuildContext context) {
    final categories = selectedType == "all"
        ? allcategories
        : selectedType == "veg"
        ? vegcategories
        : nonvegcategories;
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Column(
        children: [
          const Header(),
          Divider(),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Searchbar(
                  onSearch: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),

              const SizedBox(width: 4),

              Expanded(
                flex: 1,
                child: VegNonVegToggle(
                  initialValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value;
                      selectedCategory = "All";
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: CategoryBar(
              categories: categories,
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                    childrenPadding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      bottom: 12,
                    ),
                    collapsedIconColor: Colors.orange,
                    iconColor: Colors.orange,
                    title: const Text(
                      "Starters",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: const [Starters()],
                  ),
                ),
                Items(
                  search: searchText,
                  selectedType: selectedType,
                  selectedCategory: selectedCategory,
                ),
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

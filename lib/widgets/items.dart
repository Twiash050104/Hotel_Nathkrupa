import 'package:flutter/material.dart';
import '../screens/item_details.dart';
import '../data/menu_data.dart';
import '../widgets/no_items_found.dart';

class Items extends StatelessWidget {
  final String search;
  final String selectedType;
  final String selectedCategory;

  const Items({
    super.key,
    required this.search,
    required this.selectedType,
    required this.selectedCategory,
  });

  Widget _itemList(
    BuildContext context,
    String title,
    String subtitle,
    int price,
    String image,
    int? fullprice,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              title: title,
              subtitle: subtitle,
              price: price,
              image: image,
              fullprice: fullprice,
            ),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (fullprice != null) ...[
                        Text(
                          "Half : ₹$price",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Full : ₹$fullprice",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ] else
                        Text(
                          "₹$price",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filtered = menu.where((item) {
      final matchesSearch = item["title"].toString().toLowerCase().contains(
        search.toLowerCase(),
      );

      final matchesType = selectedType == "all" || item["type"] == selectedType;
      final matchesCategory =
          selectedCategory == "All" || item["category"] == selectedCategory;

      return matchesSearch && matchesType && matchesCategory;

      //return matchesSearch && matchesType;
    }).toList();
    if (filtered.isEmpty) {
      return NoItemsFound(searchText: search);
    }

    Map<String, List<Map<String, dynamic>>> groupedMenu = {};

    for (var item in filtered) {
      groupedMenu.putIfAbsent(item["category"], () => []);
      groupedMenu[item["category"]]!.add(item);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedMenu.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 14),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.orange.shade400, thickness: 1),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      entry.key.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  Expanded(child: Divider(color: Colors.orange, thickness: 1)),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                children: List.generate(entry.value.length, (index) {
                  final item = entry.value[index];

                  return Column(
                    children: [
                      _itemList(
                        context,
                        item["title"],
                        item["subtitle"],
                        item["price"],
                        item["image"],
                        item["fullprice"],
                      ),

                      if (index != entry.value.length - 1)
                        Divider(
                          height: 1,
                          thickness: 1,
                          indent: 112,
                          endIndent: 18,
                          color: Colors.white10,
                        ),
                    ],
                  );
                }),
              ),
            ),

            const SizedBox(height: 18),
          ],
        );
      }).toList(),
    );
  }
}

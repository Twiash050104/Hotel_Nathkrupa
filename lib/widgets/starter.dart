import 'package:flutter/material.dart';
import '../screens/item_details.dart';

class Starters extends StatelessWidget {
  const Starters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Padding(
        //   padding: EdgeInsets.only(bottom: 12, left: 12, right: 12),
        //   child: Row(
        //     children: [
        //       Expanded(child: Divider(color: Colors.orange, thickness: 1)),
        //       Text(
        //         "STARTERS",
        //         style: TextStyle(
        //           fontSize: 24,
        //           color: Colors.orange,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Expanded(child: Divider(color: Colors.orange, thickness: 1)),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                Expanded(
                  child: _Card(
                    title: "Roasted Papad",
                    subtitle: "",
                    price: 15,
                    image: "assets/images/roastedpapad.jpg",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _Card(
                    title: "Fry Papad",
                    subtitle: "",
                    price: 20,
                    image: "assets/images/frypapad.png",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _Card(
                    title: "Masala Papad",
                    subtitle: "",
                    price: 30,
                    image: "assets/images/masalapapad.png",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;
  final String image;

  const _Card({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              title: title,
              subtitle: subtitle,
              price: price,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "₹$price",
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

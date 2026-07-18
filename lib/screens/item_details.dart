import 'package:flutter/material.dart';
//import '../widgets/items.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final int price;
  final String image;
  final int? fullprice;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    this.fullprice,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Divider(),

            Text(
              widget.subtitle,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          color: Colors.black,
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.fullprice != null) ...[
                Text(
                  "Half : ₹${widget.price}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                Text(
                  "Full : ₹${widget.fullprice}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ] else
                Text(
                  "₹${widget.price}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

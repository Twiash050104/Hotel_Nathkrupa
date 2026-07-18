import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  final Function(String) onSearch;

  const Searchbar({super.key, required this.onSearch});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  late TextEditingController search;

  @override
  void initState() {
    super.initState();
    search = TextEditingController();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: search,
      onChanged: widget.onSearch,
      decoration: InputDecoration(
        hintText: "Search dishes...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}

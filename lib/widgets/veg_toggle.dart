import 'package:flutter/material.dart';

class VegNonVegToggle extends StatefulWidget {
  final Function(String) onChanged;
  final String initialValue;

  const VegNonVegToggle({
    super.key,
    required this.onChanged,
    this.initialValue = "all",
  });

  @override
  State<VegNonVegToggle> createState() => _VegNonVegToggleState();
}

class _VegNonVegToggleState extends State<VegNonVegToggle> {
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          selected = value;
          widget.onChanged(value);
        });
      },

      color: const Color(0xFF2A2A2A),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      itemBuilder: (context) => [
        PopupMenuItem(
          value: "all",
          child: Row(
            children: [
              if (selected == "all")
                const Icon(Icons.check, color: Colors.green, size: 18),

              if (selected != "all") const SizedBox(width: 18),

              const SizedBox(width: 8),

              const Text(
                "All",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "veg",
          child: Row(
            children: [
              if (selected == "veg")
                const Icon(Icons.check, color: Colors.green, size: 18),

              if (selected != "veg") const SizedBox(width: 18),

              const SizedBox(width: 8),

              const Text(
                "🟢  Veg",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        PopupMenuItem(
          value: "nonveg",
          child: Row(
            children: [
              if (selected == "nonveg")
                const Icon(Icons.check, color: Colors.red, size: 18),

              if (selected != "nonveg") const SizedBox(width: 18),

              const SizedBox(width: 8),

              const Text(
                "🔴  Non-Veg",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selected == "all"
                  ? "🍽️ All"
                  : selected == "veg"
                  ? "🟢 Veg"
                  : "🔴 Non-Veg",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            const SizedBox(width: 8),

            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

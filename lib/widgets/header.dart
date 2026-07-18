import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.black,
        //foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset(
          "assets/images/logo.jpg",
          fit: BoxFit.contain,
          height: 100,
        ),
      ),
    );
  }
}

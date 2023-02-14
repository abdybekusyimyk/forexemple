import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
  });

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      iconSize: 50,
      color: Colors.white,
      icon: Icon(
        icon,
        // size: 60,
        // color: Colors.white,
      ),
    );
  }
}

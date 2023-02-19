// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconWithTextWidget extends StatelessWidget {
  const IconWithTextWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

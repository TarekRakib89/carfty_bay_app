// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey.shade300,
        child: Icon(iconData, color: Colors.grey, size: 20),
      ),
    );
  }
}

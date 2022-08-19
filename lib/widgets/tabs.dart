import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.onTap})
      : super(key: key);

  final String text;
  final Function()?  onTap;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ));
  }
}

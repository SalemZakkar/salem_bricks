import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  final double width;
  const Bar({Key? key, required this.width}) : super(key: key);

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 10,
      color: Theme.of(context).dividerColor,
    );
  }
}

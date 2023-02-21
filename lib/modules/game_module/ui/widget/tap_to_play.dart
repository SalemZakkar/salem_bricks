import 'package:flutter/material.dart';

class TapToPlay extends StatelessWidget {
  final bool started;
  const TapToPlay({Key? key, required this.started}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return started
        ? Container()
        : Container(
            alignment: const Alignment(0, -0.1),
            child: const Text("Tap to play"),
          );
  }
}

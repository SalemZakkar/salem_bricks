import 'package:flutter/material.dart';
import 'package:salem_brick/config/app_assets.dart';
import 'package:salem_brick/services/audio_service/audio_service.dart';

class CButton extends StatefulWidget {
  final double height, width;
  final Widget child;
  final VoidCallback onPressed;

  const CButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.child,
      required this.onPressed})
      : super(key: key);

  @override
  State<CButton> createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        child: widget.child,
        onPressed: () {
          AudioService.playSound(AppAssets.pressed);
          widget.onPressed.call();
        },
      ),
    );
  }
}

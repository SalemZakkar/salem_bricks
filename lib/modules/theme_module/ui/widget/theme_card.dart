import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/config/app_assets.dart';
import 'package:salem_brick/modules/home_module/storage/home_storage.dart';
import 'package:salem_brick/modules/theme_module/models/theme_model.dart';
import 'package:salem_brick/modules/theme_module/storage/theme_storage.dart';
import 'package:salem_brick/services/audio_service/audio_service.dart';
import 'package:salem_brick/shared/shared_bloc/shared_bloc.dart';

class ThemeCard extends StatefulWidget {
  final GameTheme theme;

  const ThemeCard({Key? key, required this.theme}) : super(key: key);

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ThemeStorage.setTheme(widget.theme.id);
        HomeStorage.getSoundMode().then((value) {
          if (value) {
            AudioService.playSound(AppAssets.pressed);
          }
        });
        context.read<SharedBloc>().add(RefreshThemeEvent());
      },
      child: Container(
        width: 250,
        height: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: widget.theme.theme.scaffoldBackgroundColor,
            border: Border.all(color: Colors.white, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.theme.name,
              style: widget.theme.theme.textTheme.bodyText1!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: widget.theme.theme.textTheme.bodyText2!.color),
            ),
            Container(
                width: 100, height: 10, color: widget.theme.theme.dividerColor)
          ],
        ),
      ),
    );
  }
}

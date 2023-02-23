import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salem_brick/config/app_assets.dart';
import 'package:salem_brick/modules/game_module/controllers/ball_controller.dart';
import 'package:salem_brick/modules/game_module/controllers/brick_controller.dart';
import 'package:salem_brick/modules/game_module/routes.dart';
import 'package:salem_brick/modules/game_module/ui/game_components/ball.dart';
import 'package:salem_brick/modules/game_module/ui/game_components/bar.dart';
import 'package:salem_brick/modules/game_module/ui/widget/game_over.dart';
import 'package:salem_brick/modules/game_module/ui/widget/tap_to_play.dart';
import 'package:salem_brick/modules/home_module/bloc/home_bloc.dart';
import 'package:salem_brick/modules/home_module/storage/home_storage.dart';
import 'package:salem_brick/services/audio_service/audio_service.dart';

import '../enums/direction.dart';
import '../enums/level.dart';
import '../persistance/game_store.dart';

class GameScreen extends StatefulWidget {
  final Level level;
  final int time;
  const GameScreen({Key? key, required this.time, required this.level})
      : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  HomeBloc bloc = HomeBloc();
  List<double> dx = [0, 0];
  late BrickController controller;
  BallController bController = BallController();
  List<double> dy = [0];
  double playerWidth = 0.4;
  double enemyX = 0;
  bool gameStarted = false;
  Direction ballDirection = Direction.down;
  late Timer timer;
  late Timer playTimer;
  int sec = 0;
  void startGame() {
    if (!gameStarted) {
      gameStarted = true;
      playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          sec++;
        });
      });
      timer =
          Timer.periodic(Duration(milliseconds: widget.time.toInt()), (timer) {
        setState(() {
          dx[0] = bController.moveBallX(dx[0]);
          dy[0] = bController.moveBallY(dy[0]);
          bController.updateDirection(dx[0], dy[0], dx[1], playerWidth);
        });
        if (dy[0] >= 1 && gameStarted) {
          playLoose();
          stopGame();
        }
        if ((dy[0] >= 0.9 || dy[0] <= -0.9) && gameStarted) {
          playSoundBar();
        }
        if ((dx[0] >= 1 || dx[0] <= -1) && gameStarted) {
          playSoundWall();
        }
      });
    }
  }

  void stopGame() async {
    gameStarted = false;
    timer.cancel();
    playTimer.cancel();
    GameStore().save(widget.level, sec);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text(
                  "Looser !!!",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                content: GameOver(score: sec),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          GameStore().save(widget.level, sec);
                          gameStarted = false;
                          dx = [0, 0];
                          dy = [0];
                          sec = 0;
                          playTimer.cancel();
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        "Play Again",
                        style: Theme.of(context).textTheme.bodyText2,
                      ))
                ],
              ),
            ));
  }

  @override
  void initState() {
    controller = BrickController(screensize: 100);
    super.initState();
  }

  @override
  void dispose() {
    stopGame();
    super.dispose();
  }

  void playSoundBar() async {
    bool on = await HomeStorage.getSoundMode();
    if (on) {
      AudioService.playSound(AppAssets.hitBar);
    }
  }

  void playLoose() async {
    bool on = await HomeStorage.getSoundMode();
    if (on) {
      AudioService.playSound(AppAssets.lose);
    }
  }

  void playSoundWall() async {
    bool on = await HomeStorage.getSoundMode();
    if (on) {
      AudioService.playSound(AppAssets.hitBrick);
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.screensize = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, GameRoutes.levelsScreen);
        return false;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: (details) {
          if (!controller.init) {
            controller.setMotions(
                oldPaddle: dx[1], touch: details.globalPosition.dx);
            return;
          }
          if (details.delta.dx > 0.15 || details.delta.dx < -0.15) {
            if (details.delta.dx > 0) {
              setState(() {
                dx[1] = controller.getXPos(details.globalPosition.dx, false);
              });
            } else {
              setState(() {
                dx[1] = controller.getXPos(details.globalPosition.dx, true);
              });
            }
          }
          controller.init = false;
        },
        onTap: () {
          startGame();
        },
        child: Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              title: Text("Time: $sec sec"),
            ),
            body: Center(
              child: Stack(
                children: [
                  TapToPlay(
                    started: gameStarted,
                  ),
                  Align(
                    alignment: Alignment(dx[0], -0.9),
                    child: const Bar(width: 0.55),
                  ),
                  Align(
                    alignment: Alignment(dx[0], dy[0]),
                    child: const Ball(),
                  ),
                  Align(
                    alignment: Alignment(
                        (2 * dx[1] + playerWidth) / (2 - playerWidth), 0.9),
                    child: Bar(width: playerWidth),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

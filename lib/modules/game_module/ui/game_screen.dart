import 'dart:async';
import 'package:flutter/material.dart';
import 'package:salem_brick/modules/game_module/controllers/ball_controller.dart';
import 'package:salem_brick/modules/game_module/ui/game_components/ball.dart';
import 'package:salem_brick/modules/game_module/ui/game_components/bar.dart';
import 'package:salem_brick/modules/game_module/controllers/brick_controller.dart';
import 'package:salem_brick/modules/game_module/ui/widget/tap_to_play.dart';

import '../enums/direction.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<double> dx = [0, 0];
  late BrickController controller;
  BallController bController = BallController();
  List<double> dy = [0];
  double playerWidth = 0.55;
  double enemyX = 0;
  bool gameStarted = false;
  Direction ballDirection = Direction.down;
  late Timer timer;
  void startGame() {
    gameStarted = true;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        dx[0] = bController.moveBallX(dx[0]);
        dy[0] = bController.moveBallY(dy[0]);
        bController.updateDirection(dx[0], dy[0], dx[1], playerWidth);
      });
    });
  }

  void stopGame() {
    timer.cancel();
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

  @override
  Widget build(BuildContext context) {
    controller.screensize = MediaQuery.of(context).size.width;
    return GestureDetector(
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
                alignment: Alignment(dx[1], 0.9),
                child: Bar(width: playerWidth),
              )
            ],
          ),
        ),
      ),
    );
  }
}

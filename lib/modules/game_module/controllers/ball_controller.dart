import 'package:salem_brick/modules/game_module/enums/direction.dart';

class BallController {
  Direction directionX = Direction.left;
  Direction directionY = Direction.down;
  double moveBallY(double y) {
    if (directionY == Direction.down) {
      return y + 0.01;
    } else {
      return y - 0.01;
    }
  }

  double moveBallX(double x) {
    //print(x);
    if (directionX == Direction.left) {
      return x - 0.01;
    } else {
      return x + 0.01;
    }
  }

  void updateDirection(double x, double y, double playerX, double playerWidth) {
    if (y >= 0.9 && playerX <= x && playerX + playerWidth >= x) {
      directionY = Direction.up;
    }
    if (y <= -0.9) {
      directionY = Direction.down;
    }
    if (x >= 1) {
      directionX = Direction.left;
    }
    if (x <= -1) {
      directionX = Direction.right;
    }
  }
}

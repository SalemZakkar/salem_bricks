import 'dart:math';

class BrickController {
  double screensize;
  late List<double> motions;
  bool init = false;
  BrickController({required this.screensize});
  void setMotions({required double oldPaddle, required double touch}) {
    motions = [getScale(touch), oldPaddle];
    init = true;
  }

  double getXPos(double touch, bool left) {
    touch = getScale(touch);
    // print(touch);
    double shift = (touch - motions[0]).abs();
    double pos = 0;
    print(shift);
    if (left) {
      pos = max(motions[1] - shift - 0.04, -1);
    } else {
      pos = min(motions[1] + shift + 0.04, 1);
    }
    motions[0] = touch;
    motions[1] = pos;

    return pos;
  }

  double getScale(double x) {
    return (x - screensize / 2) / (screensize / 2);
  }
}

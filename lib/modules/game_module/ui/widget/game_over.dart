import 'package:flutter/material.dart';

class GameOver extends StatefulWidget {
  final int score;
  const GameOver({Key? key, required this.score}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Score is: ${widget.score}",
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../shared/widget/button.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: Container(
        //  constraints: const BoxConstraints.expand(),
        height: MediaQuery.of(context).size.height,

        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Levels",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 30, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 90,
              ),
              CButton(
                width: 250,
                height: 60,
                child: const Text("Easy"),
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              CButton(
                width: 250,
                height: 60,
                child: const Text("Medium"),
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              CButton(
                width: 250,
                height: 60,
                child: const Text("Hard"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

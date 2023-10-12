import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:kelime_oyunu/service/tabuservice.dart';

import 'home.dart';
import 'model/tabu.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

double time = 60.0;
double score = 10;
late TextEditingController team1Controller;
late TextEditingController team2Controller;
String team1Name = "Team 1";
String team2Name = "Team 2";
late StateProvider<int> sayacProvider;

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    team1Controller = TextEditingController();
    team2Controller = TextEditingController();
    sayacProvider = StateProvider<int>((ref) => time.toInt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                "images/logo.jpg",
                fit: BoxFit.fill,
              )),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Tabuo",
                        style: context.textTheme.headlineLarge,
                      ),
                      context.emptySizedHeightBoxNormal,
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: TextField(
                            onSubmitted: (value) => team1Name = value,
                            controller: team1Controller,
                            decoration: const InputDecoration(
                              hintText: "Takım1Isim",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: TextField(
                            onSubmitted: (value) => team2Name = value,
                            controller: team2Controller,
                            decoration: const InputDecoration(
                              hintText: "Takım2Isim",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Süre:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Slider(
                              divisions: 19,
                              label: time.toInt().toString(),
                              value: time,
                              onChanged: (value) {
                                setState(() {
                                  time = value;
                                });
                              },
                              min: 10,
                              max: 200,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Skor:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Slider(
                              divisions: 18,
                              label: score.toInt().toString(),
                              value: score,
                              onChanged: (value) {
                                setState(() {
                                  score = value;
                                });
                              },
                              min: 10,
                              max: 100,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange[400]),
                          onPressed: () {
                            ref.read(sayacProvider.notifier).state =
                                time.toInt();
                            team1.name = team1Name;
                            team2.name = team2Name;
                            team1.winScore = score.toInt();
                            team2.winScore = score.toInt();
                            debugPrint(time.toString());
                            TabuCard.tempTabuWords = TabuService.tabus
                              ..shuffle();
                            ref.read(startedGame.notifier).state = 0;
                          },
                          child: const Center(
                              child: Text(
                            "Play",
                            style: TextStyle(color: Colors.white),
                          ))),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

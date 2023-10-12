import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:kelime_oyunu/components/tabucard.dart';
import 'package:kelime_oyunu/model/team.dart';
import 'package:kelime_oyunu/restartgame.dart';
import 'package:kelime_oyunu/row.dart';
import 'package:kelime_oyunu/ongameteamchangestart.dart';
import 'mainmenu.dart';
import 'model/tabu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Team team1 = Team(score: 0, name: "Team 1", winScore: 10);
Team team2 = Team(score: 0, name: "Team 2", winScore: 10);
TabuCard? removeTabu;
var startedGame = StateProvider<int>((ref) => 3);
late CardSwiperController controller;

late StateProvider<int> selectedTeamProvider;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    selectedTeamProvider = StateProvider<int>((ref) => 1);

    controller = CardSwiperController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        switch (ref.watch(startedGame)) {
          case 0:
            return StartPage();
          case 1:
            return Scaffold(
              appBar: AppBar(
                title: InfoRow(),
                centerTitle: true,
              ),
              body: SafeArea(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 16,
                      child: CardSwiper(
                          duration: const Duration(milliseconds: 200),
                          isDisabled: true,
                          onEnd: () => null,
                          isLoop: true,
                          controller: controller,
                          cardBuilder: (context,
                              index,
                              horizontalOffsetPercentage,
                              verticalOffsetPercentage) {
                            return SizedBox(
                                width: context.dynamicWidth(0.95),
                                child: TabuCardWidget(
                                    index: index,
                                    tabuCard: TabuCard.tempTabuWords[index]));
                          },
                          cardsCount: TabuCard.tempTabuWords.length),
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Consumer(
                            builder: (context, ref, child) => ElevatedButton(
                                onPressed: () {
                                  controller.swipeLeft();
                                  ref.watch(selectedTeamProvider) == 1
                                      ? team1.score -= 2
                                      : team2.score -= 2;

                                  TabuCard.tempTabuWords.remove(
                                      TabuCard.tempTabuWords[
                                          controller.state!.index - 1]);
                                },
                                child: const Text("Tabu")),
                          ),
                          Consumer(
                            builder: (context, ref, child) => ElevatedButton(
                                onPressed: () {
                                  controller.swipeLeft();
                                  ref.watch(selectedTeamProvider) == 1
                                      ? team1.score++
                                      : team2.score++;

                                  TabuCard.tempTabuWords.remove(
                                      TabuCard.tempTabuWords[
                                          controller.state!.index - 1]);
                                },
                                child: const Text("Doğru")),
                          ),
                          Consumer(
                            builder: (context, ref, child) => ElevatedButton(
                                onPressed: () {
                                  controller.swipeLeft();
                                },
                                child: const Text("Pass")),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            );
          case 2:
            return PlayPage();
          case 3:
            return MainPage();
          default:
            return Container();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:kelime_oyunu/model/googleads.dart';

import 'home.dart';
import 'mainmenu.dart';

class PlayPage extends ConsumerStatefulWidget {
  const PlayPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayPageState();
}

class _PlayPageState extends ConsumerState<PlayPage> {
  @override
  Widget build(BuildContext context) {
    int selectedTeam = ref.watch(selectedTeamProvider);
    if (team1.score >= team1.winScore) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  team1.name,
                  style: context.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                context.emptySizedHeightBoxLow,
                Text(
                  "Kazandı",
                  style: context.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                context.emptySizedHeightBoxNormal,
                ElevatedButton(
                    onPressed: () {
                      GoogleAds().loadInterstitalAds(showAfterLoaded: true);
                      team1.score = 0;
                      team2.score = 0;
                      ref.read(sayacProvider.notifier).state = 10;
                      ref.read(startedGame.notifier).state = 1;
                      ref.read(selectedTeamProvider.notifier).state = 1;
                    },
                    child: const Center(child: Text("Yeniden Oyna"))),
                ElevatedButton(
                    onPressed: () {
                      GoogleAds().loadInterstitalAds(showAfterLoaded: true);
                      team1.score = 0;
                      team2.score = 0;
                      ref.read(sayacProvider.notifier).state = 10;
                      ref.read(startedGame.notifier).state = 3;
                    },
                    child: const Center(child: Text("Ana Menüye Dön"))),
              ],
            ),
          ),
        )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  team2.name,
                  style: context.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                context.emptySizedHeightBoxLow,
                Text(
                  "Kazandı",
                  style: context.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                context.emptySizedHeightBoxLow,
                Text("Score: ${selectedTeam == 1 ? team1.score : team2.score}",
                    style: context.textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: selectedTeam == 1 ? Colors.green : Colors.red)),
                context.emptySizedHeightBoxNormal,
                ElevatedButton(
                    onPressed: () {
                      GoogleAds().loadInterstitalAds(showAfterLoaded: true);
                      team1.score = 0;
                      team2.score = 0;
                      ref.read(sayacProvider.notifier).state = time.toInt();
                      ref.read(startedGame.notifier).state = 1;
                      ref.read(selectedTeamProvider.notifier).state = 1;
                    },
                    child: const Center(child: Text("Yeniden Oyna"))),
                context.emptySizedHeightBoxLow,
                ElevatedButton(
                    onPressed: () {
                      GoogleAds().loadInterstitalAds(showAfterLoaded: true);
                      team1.score = 0;
                      team2.score = 0;
                      ref.read(sayacProvider.notifier).state = time.toInt();
                      ref.read(startedGame.notifier).state = 3;
                    },
                    child: const Center(child: Text("Ana Menüye Dön"))),
              ],
            ),
          ),
        ),
      );
    }
  }
}

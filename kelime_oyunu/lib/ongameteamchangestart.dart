import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:kelime_oyunu/home.dart';
import 'mainmenu.dart';

class StartPage extends ConsumerStatefulWidget {
  const StartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage> {
  @override
  Widget build(BuildContext context) {
    int selectedTeam = ref.watch(selectedTeamProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(selectedTeam == 1 ? team1.name : team2.name,
                  style: context.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: selectedTeam == 1 ? Colors.green : Colors.red)),
              context.emptySizedHeightBoxLow,
              Text("Score: ${selectedTeam == 1 ? team1.score : team2.score}",
                  style: context.textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: selectedTeam == 1 ? Colors.green : Colors.red)),
              context.emptySizedHeightBoxNormal,
              ElevatedButton(
                  onPressed: () {
                    ref.read(sayacProvider.notifier).state = time.toInt();
                    ref.read(startedGame.notifier).state = 1;
                  },
                  child: Center(child: const Text("Başla"))),
            ],
          ),
        ),
      )),
    );
  }
}

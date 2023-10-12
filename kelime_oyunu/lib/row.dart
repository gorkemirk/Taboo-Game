import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import 'home.dart';
import 'mainmenu.dart';
import 'model/googleads.dart';

class InfoRow extends ConsumerStatefulWidget {
  const InfoRow({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoRowState();
}

Timer? timer1;

class _InfoRowState extends ConsumerState<InfoRow> {
  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  void dispose() {
    timer1!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedTeam = ref.watch(selectedTeamProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
            onPressed: () {
              timer1!.cancel();
              team1.score = 0;
              team2.score = 0;
              ref.read(startedGame.notifier).state = 3;
            },
            child: const Icon(
              Icons.home,
              size: 30,
            )),
        const Spacer(
          flex: 1,
        ),
        OutlinedButton(
          onPressed: null,
          child: Row(
            children: [
              Text(selectedTeam == 1 ? team1.name : team2.name,
                  style: context.textTheme.headline6?.copyWith(
                      color: selectedTeam == 1 ? Colors.green : Colors.red)),
              Text(
                " Puan: ${selectedTeam == 1 ? team1.score : team2.score}",
                style: context.textTheme.headline6?.copyWith(
                    color: selectedTeam == 1 ? Colors.green : Colors.red),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 7,
        ),
        OutlinedButton(
          onPressed: null,
          child: Text(
            ref.watch(sayacProvider).toString(),
            style: context.textTheme.headline5,
          ),
        )
      ],
    );
  }

  void timer() {
    timer1 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (ref.watch(sayacProvider) != 0) {
        ref.read(sayacProvider.notifier).state--;
      } else {
        timer.cancel();
        ref.read(sayacProvider.notifier).state = 0;
        GoogleAds().loadInterstitalAds(showAfterLoaded: true);

        if (team1.score >= team1.winScore || team2.score >= team1.winScore) {
          ref.read(startedGame.notifier).state = 2;
        } else {
          ref.watch(selectedTeamProvider) == 1
              ? ref.read(selectedTeamProvider.notifier).state = 2
              : ref.read(selectedTeamProvider.notifier).state = 1;
          ref.read(startedGame.notifier).state = 0;
        }
      }
    });
  }
}

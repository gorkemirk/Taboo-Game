import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:kelime_oyunu/model/tabu.dart';

// ignore: must_be_immutable
class TabuCardWidget extends ConsumerStatefulWidget {
  TabuCard tabuCard;
  int index;
  TabuCardWidget({super.key, required this.tabuCard, required this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabuCardWidgetState();
}

class _TabuCardWidgetState extends ConsumerState<TabuCardWidget> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewInsets(
      removeRight: true,
      removeLeft: true,
      removeTop: true,
      removeBottom: true,
      context: context,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrange[400],
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: context.sized.dynamicHeight(0.16),
              child: Center(
                child: Text(
                  widget.tabuCard.word.toString(),
                  style: context.textTheme.headline1
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
            Center(
                child: Text(
              widget.tabuCard.taboo1,
              style: context.textTheme.headline3,
            )),
            Center(
                child: Text(
              widget.tabuCard.taboo2,
              style: context.textTheme.headline3,
            )),
            Center(
                child: Text(
              widget.tabuCard.taboo3,
              style: context.textTheme.headline3,
            )),
            Center(
                child: Text(
              widget.tabuCard.taboo4,
              style: context.textTheme.headline3,
            )),
            Center(
                child: Text(
              widget.tabuCard.taboo5,
              style: context.textTheme.headline3,
            )),
            context.emptySizedHeightBoxLow
          ],
        ),
      ),
    );
  }
}

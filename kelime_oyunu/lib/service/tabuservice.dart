import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelime_oyunu/model/tabu.dart';

class TabuService {
  static List<TabuCard> tabus = [];
  static getTabus() async {
    var response = await rootBundle.loadString("images/tabu.json");
    var decodedResponse = json.decode(response);
    for (var item in decodedResponse) {
      tabus.add(TabuCard.fromMap(item));
    }
    for (var element in tabus) {
      debugPrint(element.word);
    }
  }
}

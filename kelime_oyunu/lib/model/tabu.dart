import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TabuCard {
  String word;
  String taboo1;
  String taboo2;
  String taboo3;
  String taboo4;
  String taboo5;
  TabuCard({
    required this.word,
    required this.taboo1,
    required this.taboo2,
    required this.taboo3,
    required this.taboo4,
    required this.taboo5,
  });
  static List<TabuCard> tempTabuWords = [];
  static List<TabuCard> tabuWords = [
    TabuCard(
        word: "TAVLA",
        taboo1: "ZAR",
        taboo2: "OYUN",
        taboo3: "YENMEK",
        taboo4: "MARS",
        taboo5: "KAPI"),
    TabuCard(
        word: "GOOGLE",
        taboo1: "ARAMA MOTORU",
        taboo2: "BİLGİSAYAR",
        taboo3: "İNTERNET",
        taboo4: "SİTE",
        taboo5: "SAYFA"),
    TabuCard(
        word: "BILL GATES",
        taboo1: "ZENGİN",
        taboo2: "MİCROSOFT",
        taboo3: "PARA",
        taboo4: "PC",
        taboo5: "WİNDOWS"),
    TabuCard(
        word: "OKEY",
        taboo1: "ZAR",
        taboo2: "ISTAKA",
        taboo3: "TAŞ",
        taboo4: "4 KİŞİ",
        taboo5: "OYUN"),
    TabuCard(
        word: "PARA",
        taboo1: "KAĞIT",
        taboo2: "DOLAR",
        taboo3: "SATIN ALMA",
        taboo4: "ÜLKE",
        taboo5: "KAZANMAK"),
    TabuCard(
        word: "ÇORAP",
        taboo1: "İNCE",
        taboo2: "KAÇMAK",
        taboo3: "TEN RENGİ",
        taboo4: "PARİZYEN",
        taboo5: "AYAK"),
    TabuCard(
        word: "KALEM",
        taboo1: "KURŞUN",
        taboo2: "TÜKENMEZ",
        taboo3: "DOLMA",
        taboo4: "KAĞIT",
        taboo5: "ÇİZGİ"),
    TabuCard(
        word: "AŞK",
        taboo1: "KALP",
        taboo2: "BAYAN&ERKEK",
        taboo3: "TUTKU",
        taboo4: "KIRMIZI",
        taboo5: "SEKS"),
    TabuCard(
        word: "MOUSE",
        taboo1: "FARE",
        taboo2: "BİLGİSAYAR",
        taboo3: "KLAVYE",
        taboo4: "TUŞ",
        taboo5: "KLİK"),
    TabuCard(
        word: "TAKVİM",
        taboo1: "YIL",
        taboo2: "AY",
        taboo3: "HAFTA",
        taboo4: "GÜN",
        taboo5: "SAYI"),
    TabuCard(
        word: "TELEFON",
        taboo1: "ALO",
        taboo2: "AHİZE",
        taboo3: "TUŞ",
        taboo4: "SES",
        taboo5: "NUMARA"),
    TabuCard(
        word: "MÜCEVHER",
        taboo1: "KADIN",
        taboo2: "TAKI",
        taboo3: "ALTIN",
        taboo4: "BİLEZİK",
        taboo5: "KOLYE"),
    TabuCard(
        word: "OJE",
        taboo1: "TIRNAK",
        taboo2: "RENK",
        taboo3: "SÜRMEK",
        taboo4: "ASETON",
        taboo5: "MANİKÜR"),
    TabuCard(
        word: "ŞİMŞEK",
        taboo1: "GÖKYÜZÜ",
        taboo2: "YAĞMUR",
        taboo3: "IŞIK",
        taboo4: "KALP KRİZİ",
        taboo5: "KORKU"),
    TabuCard(
        word: "STETESKOP",
        taboo1: "SES",
        taboo2: "KALP",
        taboo3: "DOKTOR",
        taboo4: "BOYUN",
        taboo5: "KULAK"),
    TabuCard(
        word: "HASTALIK",
        taboo1: "HASTANE",
        taboo2: "HASTA",
        taboo3: "DOKTOR",
        taboo4: "HEMŞİRE",
        taboo5: "İLAÇ"),
    TabuCard(
        word: "KAFATASI",
        taboo1: "BEYİN",
        taboo2: "SAÇ",
        taboo3: "KEMİK",
        taboo4: "ARKEOLOJİ",
        taboo5: "KAZI"),
    TabuCard(
        word: "GAGA",
        taboo1: "KUŞ",
        taboo2: "YEMEK",
        taboo3: "YAVRU",
        taboo4: "SOLUCAN",
        taboo5: "AĞAÇKAKAN"),
    TabuCard(
        word: "AHİZE",
        taboo1: "TELEFON",
        taboo2: "SES",
        taboo3: "ALO",
        taboo4: "TUŞ",
        taboo5: "KABİN"),
    TabuCard(
        word: "ÇERÇEVE",
        taboo1: "CAM",
        taboo2: "RESİM",
        taboo3: "PİMAPEN",
        taboo4: "AHŞAP",
        taboo5: "GÖZLÜK"),
    TabuCard(
        word: "REÇETE",
        taboo1: "DOKTOR",
        taboo2: "İLAÇ",
        taboo3: "İMZA",
        taboo4: "HASTANE",
        taboo5: "ECZANE"),
    TabuCard(
        word: "AKREP",
        taboo1: "BURÇ",
        taboo2: "SAAT",
        taboo3: "YELKOVAN",
        taboo4: "ZAMAN",
        taboo5: "İBRE"),
    TabuCard(
        word: "APLİK",
        taboo1: "DUVAR",
        taboo2: "IŞIK",
        taboo3: "LAMBA",
        taboo4: "AYDINLIK",
        taboo5: "SÜS"),
    TabuCard(
        word: "FUTBOL",
        taboo1: "TOP",
        taboo2: "İDDAA",
        taboo3: "KALE",
        taboo4: "STADYUM",
        taboo5: "MAÇ"),
    TabuCard(
        word: "BANKA",
        taboo1: "MÜŞTERİ",
        taboo2: "PARA",
        taboo3: "HESAP",
        taboo4: "ÇEK",
        taboo5: "KREDİ KARTI"),
    TabuCard(
        word: "DÜĞÜN",
        taboo1: "GELİN",
        taboo2: "DAMAT",
        taboo3: "MİSAFİR",
        taboo4: "YÜZÜK",
        taboo5: "EVLENMEK"),
    TabuCard(
        word: "ARABA",
        taboo1: "ULAŞIM",
        taboo2: "ARAÇ",
        taboo3: "HIZ",
        taboo4: "FREN",
        taboo5: "GAZ"),
    TabuCard(
        word: "UÇAK",
        taboo1: "UÇMAK",
        taboo2: "HAVA",
        taboo3: "HIZ",
        taboo4: "HOSTES",
        taboo5: "PİLOT"),
    TabuCard(
        word: "EV",
        taboo1: "ODA",
        taboo2: "SALON",
        taboo3: "WC",
        taboo4: "YAŞAMAK",
        taboo5: "YUVA"),
    TabuCard(
        word: "OFİS",
        taboo1: "ÇALIŞMAK",
        taboo2: "PARA",
        taboo3: "FOTOKOPİ",
        taboo4: "FAKS",
        taboo5: "TELEFON"),
    TabuCard(
        word: "OTEL",
        taboo1: "UYUMAK",
        taboo2: "TATİL",
        taboo3: "HİZMET",
        taboo4: "PALAS",
        taboo5: "MASAJ"),
    TabuCard(
        word: "DOST",
        taboo1: "GÜVEN",
        taboo2: "SAMİMİ",
        taboo3: "DÜRÜST",
        taboo4: "NAMUSLU",
        taboo5: "AHLAKLI"),
    TabuCard(
        word: "KAFATASI",
        taboo1: "BEYİN",
        taboo2: "SAÇ",
        taboo3: "KEMİK",
        taboo4: "ARKEOLOJİ",
        taboo5: "KAZI"),
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'taboo1': taboo1,
      'taboo2': taboo2,
      'taboo3': taboo3,
      'taboo4': taboo4,
      'taboo5': taboo5,
    };
  }

  factory TabuCard.fromMap(Map<String, dynamic> map) {
    return TabuCard(
      word: map['ana_kelime'] as String,
      taboo1: map['alt_kelimeler'][0] as String,
      taboo2: map['alt_kelimeler'][1] as String,
      taboo3: map['alt_kelimeler'][2] as String,
      taboo4: map['alt_kelimeler'][3] as String,
      taboo5: map['alt_kelimeler'][4] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TabuCard.fromJson(String source) =>
      TabuCard.fromMap(json.decode(source) as Map<String, dynamic>);
}

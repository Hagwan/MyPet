// To parse this JSON data, do
//

import 'dart:convert';

List<Facts> FactsFromJson(String str) =>
    List<Facts>.from(json.decode(str).map((x) => Facts.fromJson(x)));

String FactsToJson(List<Facts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Facts {
  Facts({
    required this.fact,
  });

  String fact;

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
        fact: json["fact"],
      );

  Map<String, dynamic> toJson() => {
        "name": fact,
      };
}

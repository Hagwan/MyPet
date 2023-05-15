bool checkMessageLang(String words) {
  bool arCheck = false;
  RegExp exp =
      RegExp("[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]");
  String str = words.trim().split(' ')[0];

  exp.allMatches(str).forEach((m) {
    arCheck = true;
  });

  return arCheck;
}

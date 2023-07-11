class ValidAnagram {
  static bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }

    Map<String, int> countS = {};
    Map<String, int> countT = {};

    for (int i = 0; i < s.length; i++) {
      print("S: ${countS} | T: ${countT}");
      countS[s[i]] = 1 + (countS[s[i]] ?? 0);
      countT[t[i]] = 1 + (countT[t[i]] ?? 0);
    }

    for (String c in countS.keys) {
      if (countS[c] != (countT[c] ?? 0)) {
        return false;
      }
    }

    return true;
  }

  static void runValidAnagram() {
    String s = "anagram";
    String t = "nagaram";

    bool result = isAnagram(s, t);

    print("Is Anagram? $result");
  }
}

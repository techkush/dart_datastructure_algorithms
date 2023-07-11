/* 
Valid Anagram (Uber Code Question) - Easy

Given two strings s and t, return true if t is an anagram of s, and false 
otherwise.
An Anagram is a word or phrase formed by rearranging the letters of a different 
word or phrase, typically using all the original letters exactly once.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false

Constraints:
1 <= s.length, t.length <= 5 * 104
s and t consist of lowercase English letters.
*/

class ValidAnagram {
  static bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }

    Map<String, int> countS = {};
    Map<String, int> countT = {};

    for (int i = 0; i < s.length; i++) {
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

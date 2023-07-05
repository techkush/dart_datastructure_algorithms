import 'dart:math' as math;
// Jump Search

class JumpSearch {
  static int jumpSearch(List<int> sortedList, int target) {
    int n = sortedList.length;
    int step = math.sqrt(n).toInt();
    int prev = 0;

    while (sortedList[math.min(step, n) - 1] < target) {
      prev = step;
      step += math.sqrt(n).toInt();
      if (prev >= n) return -1; // Target not found
    }

    while (sortedList[prev] < target) {
      prev++;
      if (prev == math.min(step, n)) return -1; // Target not found
    }

    if (sortedList[prev] == target) {
      return prev;
    }

    return -1; // Target not found
  }

  static int easyJumpSearch(List<int> sortedList, int target) {
    int start = 0;
    int n = sortedList.length;
    int end = math.sqrt(n).toInt();
    while (sortedList[end] < target && start < n) {
      start = end;
      end = end + math.sqrt(n).toInt();
      if (end > n - 1) {
        end = n;
      }
    }

    for (int i = start; i < end; i++) {
      if (sortedList[i] == target) {
        return i;
      }
    }

    return -1;
  }

  static void runTernarySearch() {
    List<int> numbers = [1, 3, 5, 7, 9, 11, 13, 15];
    print(easyJumpSearch(numbers, 12));
  }
}

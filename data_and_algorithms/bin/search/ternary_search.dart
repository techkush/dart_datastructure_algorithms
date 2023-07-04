class TernarySearch {
  static int ternarySearch(List<int> sortedList, int target) {
    int left = 0;
    int right = sortedList.length - 1;

    while (left <= right) {
      int mid1 = left + ((right - left) / 3).truncate();
      int mid2 = right - ((right - left) / 3).truncate();

      if (sortedList[mid1] == target) return mid1;
      if (sortedList[mid2] == target) return mid2;

      if (sortedList[mid1] > target) {
        right = mid1 - 1;
      } else if (sortedList[mid2] < target) {
        left = mid2 + 1;
      } else {
        left = mid1 + 1;
        right = mid2 - 1;
      }
    }
    return -1;
  }

  static int recursiveTernarySearch(
      List<int> sortedList, int left, int right, int target) {
    if (left <= right) {
      int mid1 = left + ((right - left) / 3).truncate();
      int mid2 = right - ((right - left) / 3).truncate();

      if (sortedList[mid1] == target) return mid1;
      if (sortedList[mid2] == target) return mid2;

      if (sortedList[mid1] > target) {
        return recursiveTernarySearch(sortedList, left, (mid1 - 1), target);
      } else if (sortedList[mid2] < target) {
        left = mid2 + 1;
        return recursiveTernarySearch(sortedList, (mid2 + 1), right, target);
      } else {
        return recursiveTernarySearch(
            sortedList, (mid1 + 1), (mid2 - 1), target);
      }
    }

    return -1;
  }

  static void runTernarySearch() {
    List<int> numbers = [1, 3, 5, 7, 9, 11, 13, 15];
    print(recursiveTernarySearch(numbers, 0, (numbers.length), 13));
  }
}

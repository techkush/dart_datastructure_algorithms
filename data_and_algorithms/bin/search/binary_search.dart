import 'dart:math' as math;

/// Binary Search is defined as a searching algorithm used in a sorted array by
/// repeatedly dividing the search interval in half. The idea of binary search
/// is to use the information that the array is sorted and reduce the time
/// complexity to O(log N).
/// Best Case Time Complexity: O(1)
/// Worst Case Time Complexity: O(logN)
/// Auxiliary Space: O(1)
/// https://www.geeksforgeeks.org/binary-search/
///
///

class BinarySearch {
  // Iterative  Binary Search Algorithm:
  // Here we use a while loop to continue the process of comparing the key and
  // splitting the search space in two halves.
  static T? binarySearch<T extends Comparable>(List<T> sortedList, T target) {
    int low = 0;
    int high = sortedList.length - 1;

    while (low <= high) {
      int mid = low + ((high - low) ~/ 2);
      T midValue = sortedList[mid];
      print('mid: $mid | low: $low | high: $high');

      if (midValue == target) {
        print('midValue == target');
        return midValue; // Found the target value
      } else if (midValue.compareTo(target) < 0) {
        print('equal value');
        low = mid + 1; // Target is in the right half
      } else {
        print('not equal value');
        high = mid - 1; // Target is in the left half
      }
    }

    return null; // Target value not found
  }

  // Recursive  Binary Search Algorithm:
  // Create a recursive function and compare the mid of the search space with
  //the key. And based on the result either return the index where the key is
  //found or call the recursive function for the next search space.
  static int recursiveBinarySearch(
      List<int> list, int left, int right, int target) {
    if (left <= right) {
      int mid = left + ((right - left) ~/ 2);
      if (list[mid] == target) return mid;
      if (list[mid] < target) {
        return recursiveBinarySearch(list, (mid + 1), right, target);
      }
      return recursiveBinarySearch(list, left, (mid - 1), target);
    }

    return -1;
  }

  static void runBinarySearch() {
    List<int> numbers = [1, 3, 5, 7, 9, 11, 13, 15];

    int? result = recursiveBinarySearch(numbers, 0, (numbers.length - 1), 3);
    print(result);

    numbers = [2, 3, 4, 10, 40];
    int target = 2;

    result = binarySearch(numbers, target);

    if (result != null) {
      print("Target value $target found in the list.");
    } else {
      print("Target value $target not found in the list.");
    }
  }
}

// https://www.quora.com/What-is-meta-binary-search
class MetaBinarySearch {
  static T? metaBinarySearch<T extends Comparable>(
      List<List<T>> sortedLists, T target) {
    int low = 0;
    int high = sortedLists.length - 1;

    while (low <= high) {
      int mid = low + ((high - low) ~/ 2);
      List<T> midList = sortedLists[mid];

      if (midList.isEmpty) {
        low = mid + 1;
        continue;
      }

      T midValue = midList.first;

      if (midValue == target) {
        return midValue; // Found the target value
      } else if (midValue.compareTo(target) < 0) {
        low = mid + 1; // Target is in the right half
      } else {
        high = mid - 1; // Target is in the left half
      }
    }

    return null; // Target value not found
  }

  static int reWrieMetaBinarySearch(List<int> sortedLists, int target) {
    int n = sortedLists.length;
    int lg = ((math.log(n - 1) / math.log(2)) + 1).truncate();

    int pos = 0;
    for (int i = lg; i >= 0; i--) {
      print(i);
      if (sortedLists[pos] == target) {
        return pos;
      }
      int newPos = pos | (1 << i);
      if (newPos < n && sortedLists[newPos] <= target) {
        pos = newPos;
      }
    }
    return sortedLists[pos] == target ? pos : -1;
  }

  static runMetaBinarySearch() {
    List<int> numbers = [1, 3, 5, 7, 9, 11, 13, 15];
    reWrieMetaBinarySearch(numbers, 13);

    // List<List<int>> sortedLists = [
    //   [1, 3, 5, 7, 9],
    //   [11, 13, 15],
    //   [20, 22, 24, 26],
    //   [30, 32]
    // ];
    // int target = 11;

    // int? result = metaBinarySearch(sortedLists, target);

    // if (result != null) {
    //   print("Target value $target found in the list.");
    // } else {
    //   print("Target value $target not found in the list.");
    // }
  }
}

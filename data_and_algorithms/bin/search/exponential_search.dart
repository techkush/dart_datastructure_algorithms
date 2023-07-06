class ExponentialSearch {
  static int exponentialSearch(List<int> arr, int target) {
    int length = arr.length;

    if (arr[0] == target) {
      return 0;
    }

    int i = 1;
    while (i < length && arr[i] <= target) {
      i *= 2;
    }

    return binarySearch(arr, i ~/ 2, (i > length - 1) ? i : length - 1, target);
  }

  static int binarySearch(List<int> arr, int left, int right, int target) {
    if (right >= left) {
      int mid = left + ((right - left) ~/ 2);

      if (arr[mid] == target) {
        return mid;
      }

      if (arr[mid] > target) {
        return binarySearch(arr, left, mid - 1, target);
      }

      return binarySearch(arr, mid + 1, right, target);
    }

    return -1; // Target element not found
  }

  static void runExpnentialSearch() {
    List<int> arr = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
    int target = 14;

    int result = exponentialSearch(arr, target);
    if (result == -1) {
      print("Element not found in the array.");
    } else {
      print("Element found at index $result.");
    }
  }
}

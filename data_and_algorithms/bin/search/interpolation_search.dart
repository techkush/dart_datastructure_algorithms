class InterpolationSearch {
  static int interpolationSearch(List<int> arr, int target) {
    int low = 0;
    int high = arr.length - 1;

    while (low <= high && target >= arr[low] && target <= arr[high]) {
      if (low == high) {
        if (arr[low] == target) {
          return low;
        } else {
          return -1; // Target not found
        }
      }

      int pos =
          low + ((target - arr[low]) * (high - low)) ~/ (arr[high] - arr[low]);

      if (arr[pos] == target) {
        return pos;
      }

      if (arr[pos] < target) {
        low = pos + 1;
      } else {
        high = pos - 1;
      }
    }

    return -1; // Target not found
  }

  static runInterpolationSearch() {
    List<int> arr = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
    int target = 12;

    int index = interpolationSearch(arr, target);
    if (index != -1) {
      print("Element $target found at index $index");
    } else {
      print("Element $target not found in the array");
    }
  }
}

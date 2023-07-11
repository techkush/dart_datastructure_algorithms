import 'dart:math' as math;

class FibonacciSearch {
  static int fibonacciSearch(List<int> arr, int target) {
    int length = arr.length;

    int fib2 = 0; // (m-2)th Fibonacci number
    int fib1 = 1; // (m-1)th Fibonacci number
    int fib = fib2 + fib1; // mth Fibonacci number

    while (fib < length) {
      fib2 = fib1;
      fib1 = fib;
      fib = fib2 + fib1;
    }

    int offset = -1; // Offset from the start of the array

    while (fib > 1) {
      int i = math.min(offset + fib2, length - 1);

      if (arr[i] < target) {
        fib = fib1;
        fib1 = fib2;
        fib2 = fib - fib1;
        offset = i;
      } else if (arr[i] > target) {
        fib = fib2;
        fib1 = fib1 - fib2;
        fib2 = fib - fib1;
      } else {
        return i; // Target element found
      }
    }

    // Last element check
    if (fib1 == 1 && arr[offset + 1] == target) {
      return offset + 1;
    }

    return -1; // Target element not found
  }

  static void runFibonacciSearch() {
    List<int> arr = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
    int target = 14;

    int result = fibonacciSearch(arr, target);
    if (result == -1) {
      print("Element not found in the array.");
    } else {
      print("Element found at index $result.");
    }
  }
  // hello world
}

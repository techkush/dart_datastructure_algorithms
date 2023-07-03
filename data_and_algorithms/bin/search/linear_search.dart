///
/// Linear Search is defined as a sequential search algorithm that starts at one
/// end and goes through each element of a list until the desired element is
/// found, otherwise the search continues till the end of the data set.
/// Best Case Time Complexity: O(1)
/// Worst Case Time Complexity: O(n)
/// Auxiliary Space: O(1)
/// https://www.geeksforgeeks.org/linear-search/
///

class LinearSearch {
  static runLinearSearch() {
    List<int> numbers = [1, 2, 3, 4, 5, 123, 456, 123, 678, 234, 123, 890];
    int? result = linearSearch(numbers, 456);
    if (result != null) {
      print("Element found: $result");
    } else {
      print("Element not found");
    }

    // List<String> names = ["Alice", "Bob", "Charlie"];
    // String? nameResult = linearSearch(names, "Bob");
    // if (nameResult != null) {
    //   print("Name found: $nameResult");
    // } else {
    //   print("Name not found");
    // }
  }

  static int linearSearchBasic(List<int> list, int key) {
    for (int i = 1; i < list.length; i++) {
      if (list[i] == key) {
        return i;
      }
    }
    return -1;
  }

  static T? linearSearch<T>(List<T> list, T key) {
    for (var i = 0; i < list.length; i++) {
      print('linear search algorith: $i');
      if (list[i] == key) {
        return list[i];
      }
    }
    return null;
  }
}

class SentinelLinearSearch {
  static T? sentinelLinearSearch<T>(List<T> list, T key) {
    final T lastElement = list[list.length - 1]; // Store the last element
    list[list.length - 1] = key; // Set the last element as the sentinel

    int i = 0;
    while (list[i] != key) {
      print('sentinel linear search algorith: $i');
      i++;
    }

    list[list.length - 1] = lastElement; // Restore the original last element

    if (i < list.length - 1 || list[list.length - 1] == key) {
      return list[i];
    } else {
      return null;
    }
  }

  static runLinearSearch() {
    List<int> numbers = [1, 2, 3, 4, 5, 123, 456, 123, 678, 234, 123, 890];
    int? result = sentinelLinearSearch(numbers, 456);
    if (result != null) {
      print("Element found at index: $result");
    } else {
      print("Element not found");
    }

    // List<String> names = ["Alice", "Bob", "Charlie"];
    // String? nameResult = sentinelLinearSearch(names, "Bob");
    // if (nameResult != null) {
    //   print("Name found: $nameResult");
    // } else {
    //   print("Name not found");
    // }
  }
}

class MyLinearSearch {
  static T? myLinearSearch<T>(List<T> list, T key) {
    for (var i = 0; i < list.length; i++) {
      print('my linear search algorith: $i');
      if (list[i] == key) {
        return list[i];
      }
      if (list[list.length - (1 + i)] == key) {
        return list[list.length - (1 + i)];
      }
      if (i == list.length - (1 + i) || (i + 1) == list.length - (1 + i)) {
        return null;
      }
    }
    return null;
  }

  static runLinearSearch() {
    List<int> numbers = [1, 2, 3, 4, 5, 123, 456, 123, 678, 234, 123, 890];
    int? result = myLinearSearch(numbers, 456);
    if (result != null) {
      print("Element found at index: $result");
    } else {
      print("Element not found");
    }

    // List<String> names = ["Alice", "Bob", "Charlie"];
    // String? nameResult = myLinearSearch(names, "Bob");
    // if (nameResult != null) {
    //   print("Name found: $nameResult");
    // } else {
    //   print("Name not found");
    // }
  }
}

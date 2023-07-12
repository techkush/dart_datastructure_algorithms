/*




*/

class MergeTwoSortedArray {
  static meregeTwoSortedArray(List<int> numOne, List<int> numTwo) {
    // List<int> numOne = [1, 2, 4, 6];
    // List<int> numTwo = [1, 2, 3, 5];
    List<int> newArray = [];
    int temp = 0;

    for (int i = 0;
        numOne.length < numTwo.length ? i < numOne.length : i < numTwo.length;
        i++) {
      if (temp == 0) {
        if (numOne[i] == numTwo[i]) {
          newArray.add(numOne[i]);
          newArray.add(numTwo[i]);
        } else if (numOne[i] < numTwo[i]) {
          newArray.add(numOne[i]);
          temp = numTwo[i];
        } else if (numOne[i] > numTwo[i]) {
          newArray.add(numTwo[i]);
          temp = numOne[i];
        }
      } else {
        if (numOne[i] == numTwo[i] && temp > numOne[i]) {
          newArray.add(numOne[i]);
          newArray.add(numTwo[i]);
        } else if (numOne[i] < numTwo[i]) {
          if (temp < numOne[i]) {
            newArray.add(temp);
            temp = numOne[i];
          } else {
            newArray.add(numOne[i]);
          }
        } else if (numOne[i] > numTwo[i]) {
          if (temp < numTwo[i]) {
            newArray.add(temp);
            temp = numTwo[i];
          } else {
            newArray.add(numTwo[i]);
          }
        }
      }

      // if (temp == numOne[i]) {
      //   newArray.add(temp);
      //   temp = numTwo[i];
      // } else if (temp < numOne[i]) {
      //   newArray.add(temp);
      //   temp = numOne[i];
      // } else {
      //   newArray.add(numOne[i]);
      // }

      // if (numOne[i] == numTwo[i]) {
      //   newArray.add(numOne[i]);
      //   newArray.add(numTwo[i]);
      //   continue;
      // } else if (numOne[i] < numTwo[i]) {
      //   newArray.add(numOne[i]);
      // } else {
      //   newArray.add(numTwo[i]);
      // }
    }
    print(newArray);
  }
}

void main(List<String> arguments) {
  MergeTwoSortedArray.meregeTwoSortedArray(
      [1, 2, 4, 6, 7, 9, 10], [1, 2, 3, 5, 6, 8, 9]);
}

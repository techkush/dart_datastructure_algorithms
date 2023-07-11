class TwoSumSorted {
  static twoSumSorted(List<int> array, int target) {
    int left = 0;
    int right = array.length - 1;

    while (left < right) {
      int currentSum = array[left] + array[right];
      if (currentSum < target) {
        left += 1;
      }else if(currentSum < target){
        right -= 1;
      }else{
        print([1+1, r+1]);
      }
    }
  }
}
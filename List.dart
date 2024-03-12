void main() {
  var myNumList = [0, 1, 2, 3, 4];
  var myAlphaList = ['a', 'b', 'c', 'd', 'e'];
  var myMixedList = [0, 'a', 1, 'b', 2, 'c', 3, 'd', 4, 'e'];
  print(myNumList);
  print(myAlphaList);
  print(myMixedList);
  // return indeexed vaalue
  print(myMixedList[4]);

  // length of list
  print(myMixedList.length);

  //concatination
  print(myMixedList + myNumList);

  //spread operator
  print([0, 1, 2, ...myNumList]);

  //list range method
  print(myMixedList.sublist(0, 4));
}

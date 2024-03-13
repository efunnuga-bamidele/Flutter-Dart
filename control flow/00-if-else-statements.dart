void main() {
  var name = "Greg";
  var wrongName = "Wrong";
  var storedName = 'Greg';
  
  if (name==storedName){
    print('Match!');
  }
  //
  //
  if (wrongName == storedName){
    print('Match!');
  }else{
    print("Not a Match!");
  }
  //
  //
  if (wrongName == storedName){
    print('Match!');
  }else if(wrongName[wrongName.length-1] =='g'){
    print("Last letter is g!");
  }else{
    print("Not a Match!");
  }
  
  
  
}

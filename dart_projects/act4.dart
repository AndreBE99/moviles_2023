void main(List<String> args) {
  var N = 10;
  for(int i = 1; i <= N; i++){
    for(int j = 1; j <= 10; j++){
      var mult = i * j;
      print("$i * $j = $mult");
    }
  }
}
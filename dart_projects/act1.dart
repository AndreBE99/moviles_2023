void main(List<String> args) {
  var N = 17;
  int res1 = 0;
  int res2 = 0;
  int res3 = 0;
  for(int i=0; i<=N; i++) {
    res1 += i;
  }
  print(res1);
  for(int i=0; i<=N; i+=2) {
    res2 += i;
  }
  print(res2);
  N = 30;
  for(int i=0; i<=N; i++) {
    res3 += i*4;
  }
  print(res3);

}
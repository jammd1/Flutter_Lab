// var.. dynamic..

class User {}

void main() {
  int d1 = 10;
  //d1 = "dwdww"; // error
  //d1 = 1.2; // error
  //var은 타입 유츄 기법이다.. 선언하는 라인에서 대입되는 값에 의해 타입이 고정된다.

  dynamic d3 = 10;
  d3 =
      "dwdwdwdw"; // error 없음.. dynamic은 모든 타입 허용.. 타입 체크 안함.. 런타임 시점에 에러 발생할 수 있다.
  // 남발은 좋지 않다.

  var d4;
  d4 = 10;
  d4 = "dwddwdw";
  d4 = "dwdwdw";
  // 값 대입하지 않았다... 유추 불가능하다.
}

// 외부에서 import 해서 사용해야하는 다트 파일 가정

int someNum = 10;
String someStr = "Hello, Dart!";

// 다트 언어에서는 다른 언어에서 제공하는 접근 제한자를 제공하지 않는다.
// public, private 드의 예약어가 없다.
// _ 를 이름 앞에 추가해서 private 개념을 표현한다.
String _someStr1 = "private var";

void someFunction() => {};

void someFunction2() => {};

class User1 {
  String name;
  int age;

  User1(this.name, this.age);
}

class User2 {
  String name;
  int age;

  User2(this.name, this.age);
}

void main() {
  someNum = 10;
  someStr = "Dart is great";

  someFunction();
  someFunction2();

  var user1 = User1("aa", 10)
    ..name = "aa"
    ..age = 20;

  var user2 = User2("bb", 20)
    ..name = "bb"
    ..age = 30;
}

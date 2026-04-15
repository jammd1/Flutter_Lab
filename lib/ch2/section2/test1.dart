// const(compile time) vs final(run time)
// 탑 레벨에 선언되는 상수 변수
// 선언과 동시에 초기값 대입 필요하다.
const String d1 = "hello";
// final 변수는 실행 시간에 초기값을 대입할 수 있다.
final int d2 = 10;
void main() {
  // d1 = "hi"; // error
  // d2 = 20; // error
}

class User {
  // object 멤버를 const로 상수 변수로 만들 수 없다.
  // 하지만 클래스 멤버는 static const로 만들 수 있다.
  // 런타임 시점에 값 변경이 안되므로// 메번 객체 생성시에 동일한 값을 가진 메모리가 확보되지 않도록 static const로 선언한다.
  // static 멤버는 const 선언 가능.. 어차피 메모리 한번만 확보 그 곳의 값을 고정.. 상수로
  static const String d1 = 'jdwdw';
  // 생성자... 생성자 매개변수로 멤버 변수 초기화 구문

  // 선언과 동시에 값을 대입하지는 않았다.. 코드가 실행되어야 값이 대입된다..
  // 상수 변수다 럼타임 시점의 상수 변수
  final int d2;

  User(this.d2);

  void some() {
    const String d3 = "hello";
    // 선언하는 라인에서 초기값을 지정하지 않아도 된다
    // 코드가 실행되면서 초기값 대입 가능하다
    // 한번 대입되면 값 변경은 불가하다.
    final int d4;
    d4 = 10;
  }
}

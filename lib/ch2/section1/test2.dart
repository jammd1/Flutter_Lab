// as 뒤의 tes1은 이 파일내에서만 적용되는 alias이다.. 개발자 임의 단어
// show로 내가 필요한 것만, hide로 내가 필요없는 것을 제외할 수 있다.
import 'outer.dart' as test1 show someNum, User1 hide someStr;

// 다트는 함수를 선언할 때 리턴과 관련된 표현을 생략할 수 있다.
// 함수명이 main()이면 entry point..
void main() {
  test1.someNum = 100;
  //test1.someStr = "dwdwdwdw"; // error
  test1.User1 user1;
}

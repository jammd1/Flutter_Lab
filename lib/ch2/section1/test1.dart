//import 'outer.dart';
// 같은 프로젝트 내에 있는 다트 파일을 import 할 때 위에처럼 상대경로로 파일을 명시 가능
// 원한다면 같은 프로젝트 내의 다트 파일을 package로 절대 경로 명시 가능
// 절대 경로 명시할 때.. 패키지명/ 가 지칭하는 위치는 lib
import 'package:flutter_practice_1/ch2/section1/outer.dart';

void main() {
  someNum = 100;
  someStr = "dqwndwo";
  //_someStr1 = "private var change"; //error
  someFunction();
  someFunction2();
}

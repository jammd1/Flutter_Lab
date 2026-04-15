void main() {
  // list
  // 선언과 동시에 값 지정이 가능한 경우
  List<int> list1 = [1, 2, 3, 4, 5];

  list1[0] *= 10;
  list1.add(6); // 사이즈 가변
  list1.removeAt(list1.length - 1);

  // 배열처럼 사이즈를 고정으로 쓰고 싶다..
  // filled()라는 생성자를 이용한다.

  var list2 = List.filled(5, 0); // 사이즈 5, 초기값 0
  list2[0] = 10;
  //list2.add(1); // runtime error.. 사이즈 고정이라서 추가 불가

  // 사이즈 가변
  var list3 = List<int>.filled(3, 0, growable: true);

  // 초기값을 함수로.. 함수가 실행되고 결과값으로.. generate()라는 생성자 이용
  var list4 = List<int>.generate(5, (idx) => idx * 10, growable: true);

  Map<String, dynamic> userInfo = {
    "name": "John Doe",
    "age": 30,
    "isAdmin": false,
  };

  userInfo["name"];
  userInfo.values;
}

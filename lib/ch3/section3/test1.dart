import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Widget> widgetList = [
    //case 1 - 위젯의 타입이 다르다면..
    // 위젯의 타입이 다르다면 상태와 위젯의 매핑에 문제가 없다.
    //MyColorItemWidget1(Colors.red),
    //MyColorItemWidget2(Colors.blue)

    // case 2 - 동이 타입의 위젯이 여러개인 경우
    // 도일 타입의 위젯이 여러개라면 타입으로 식별할 수 없어서 순서로 상태를 연결한다.
    // 구조 변경 (추가, 제거 교체)들에서 상태 연결에 문제 발생 가능성
    //MyColorItemWidget1(Colors.red),
    //MyColorItemWidget1(Colors.blue),

    // case 3 key로 매핑
    // key가 지정이 되면 키를 최우선순위로 이용해서 상태와 위젯을 매핑
    MyColorItemWidget1(Colors.red, key: UniqueKey(),),
    MyColorItemWidget1(Colors.blue, key: UniqueKey(),),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("key test"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: widgetList,
            ),
            ElevatedButton(onPressed: onChange, child: Text('toggle'))
          ],
        ),
      ),
    );
  }

  void onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }
}
class MyColorItemWidget1 extends StatefulWidget {
  Color color;
  MyColorItemWidget1(this.color, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyColorState1(color);
}

class MyColorState1 extends State<MyColorItemWidget1> {
  Color color;
  MyColorState1(this.color);

  @override
  Widget build(BuildContext context) {
    // 여백 확장.. weight 개념
    return Expanded(
        child: Container(
          color: color,
          height: 150,
        )
    );
  }
}

class MyColorItemWidget2 extends StatefulWidget {
  Color color;
  MyColorItemWidget2(this.color, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyColorState2(color);
}

class MyColorState2 extends State<MyColorItemWidget2> {
  Color color;
  MyColorState2(this.color);

  @override
  Widget build(BuildContext context) {
    // 여백 확장.. weight 개념
    return Expanded(
        child: Container(
          color: color,
          height: 150,
        )
    );
  }
}
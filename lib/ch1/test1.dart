// 현재 파일이 아닌 외부 파일의 api를 이용하려면 무조건 import 해야한다.
// 동일 폴더에 있는 외부 파일도.. import 해야한다.

// package 명이 flutter: flutter sdk에서 공식 제공하는 패키지이다.
// material.dart: UI가 출력되는 앱을 개발하기 위한 기본
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp()); // 화면 출력하라.. 매개변수의 객체를
}

// 화면을 구성하기 위한 개발자 클래스.. (통칭해서 위젯이라 부른다.)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 화면을 구성하기 위해서 자동 호출된다.
  // 이 함수에서 리턴시키는 것이 화면에 출력된다.

  @override
  Widget build(BuildContext context) {
    // 필수는 아니다.. 사실상의 필수이다..
    // 클래스의 객체 생성시에 new 예약어를 써도 되고 안 써도 된다.
    return MaterialApp(
      home: Scaffold(
        // 화면의 기본 구조를 제공하는 사실상의 필수이다.
        appBar: AppBar(
          title: const Text('영단어 생성기'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Text(
            WordPair.random().asPascalCase,
            style: const TextStyle(
              fontSize: 90,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}

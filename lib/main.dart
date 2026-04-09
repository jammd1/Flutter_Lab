import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: '플러터 데모 홈페이지'),
    ),
    GoRoute(path: '/timer', builder: (context, state) => const TimerPage()),
    GoRoute(path: '/cat', builder: (context, state) => const CatPage()),
    GoRoute(
      path: '/catDetail/:imageUrl',
      builder: (context, state) {
        final imageUrl = state.pathParameters['imageUrl']!;
        final decodedUrl = Uri.decodeComponent(imageUrl);
        return CatDetailPage(imageUrl: decodedUrl);
      },
    ),
  ],
);

final dio = Dio();

const String apiKey =
    'live_R4bzFTDcJfpDSUVWv5EGQ95zIz6JNYomPrFTqDmfQj1C9FhTxIRvsreOQCyGUlcH';

Future<List<dynamic>> fetchCatData() async {
  try {
    final response = await dio.get(
      'https://api.thecatapi.com/v1/images/search?limit=10',
      options: Options(headers: {'x-api-key': apiKey}),
    );
    return response.data;
  } catch (e) {
    developer.log('Failed to fetch cat data: $e');
    rethrow;
  }
}

void main() {
  runApp(const MyApp());
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _resetTimer(); // 페이지가 열릴 때 타이머 초기화
  }

  void _startTimer() {
    _isRunning = true;
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _isRunning) {
        setState(() {
          _seconds++;
        });
        _startTimer(); // 타이머를 계속해서 재귀적으로 호출
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _seconds = 0;
    });
  }

  void stopTimer() {
    setState(() {
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _isRunning = false; // 타이머 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('타이머 페이지'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '경과 시간: $_seconds 초',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRunning ? _stopTimer : _startTimer,
              child: Text(_isRunning ? '멈추기' : '시작하기'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _resetTimer, child: const Text('초기화')),
          ],
        ),
      ),
    );
  }
}

class CatDetailPage extends StatelessWidget {
  final String imageUrl;

  const CatDetailPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('고양이 상세 페이지'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter == 0) return; // 0 이하로 감소하지 않도록 방지
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('다음 숫자만큼 버튼을 눌렀습니다.:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'cat',
            onPressed: () => context.push('/cat'),
            tooltip: '고양이 페이지로 이동',
            child: const Icon(Icons.pets),
          ),
          SizedBox(height: 16), // 버튼 사이에 간격 추가
          FloatingActionButton(
            heroTag: 'timer',
            onPressed: () => context.push('/timer'),
            tooltip: '타이머 페이지로 이동',
            child: const Icon(Icons.timer),
          ),
          SizedBox(height: 16), // 버튼 사이에 간격 추가
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: _incrementCounter,
            tooltip: '증가',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 16), // 버튼 사이에 간격 추가
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: _counter > 0
                ? _decrementCounter
                : () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('0 이하로 감소할 수 없습니다.')),
                    ),
                  },
            tooltip: '감소',
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 16), // 버튼 사이에 간격 추가
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: _resetCounter,
            tooltip: '초기화',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('고양이 페이지'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCatData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('데이터를 불러오는 데 실패했습니다: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('고양이 데이터를 찾을 수 없습니다.'));
          } else {
            final cats = snapshot.data!;
            return ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, index) {
                final cat = cats[index];
                final String rawUrl = cat['url'];
                return ListTile(
                  leading: Image.network(
                    cat['url'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('고양이 ${index + 1}'),
                  onTap: () {
                    final encodedUrl = Uri.encodeComponent(rawUrl);
                    context.push('/catDetail/$encodedUrl');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

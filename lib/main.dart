// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
////파란 줄을 없애기 위한 빠른 수정

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 우측 상단 debug 띠 제거
      title: 'Testing App Bar',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Testing Thomas Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //도화지
      appBar: AppBar(
        //상단바
        title: Text(
            widget.title), //Myapp class의 매개인자 가져옴 : Testing Thomas Home Page
        centerTitle: true, //중앙정렬
        backgroundColor: Colors.redAccent,
        elevation: 5.0, //붕떠 있는 느낌(바 하단 그림자)

        // leading: IconButton(  //leading은 아이콘 버튼이나 간단한 위젯을 왼쪽에 배치
        //   icon: Icon(Icons.menu),
        //   onPressed: () { //터치, 클릭하면 번쩍하는 이벤트
        //     print('menu button is clicked.');
        //   }

        // ),

        actions: [
          //action은 복수의 아이콘, 버튼들을 오른쪽에 배치, AppBar에서만 적용
          //이곳에 한개 이상의 위젯들을 가진다.

          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print('shopping button is clicked.');
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search button is clicked.');
              }),
        ],
      ),

      drawer: Drawer(
        //왼쪽 메뉴를 만들어보나
        child: ListView(
          //클릭했을때 리스트 보여주기
          padding: EdgeInsets.zero, //빈공간 0
          children: [
            UserAccountsDrawerHeader(
              //사용자 헤드 메세지 부분
              accountName: Text('Thomas'), //필수 입력 사항
              accountEmail: Text('tulee3474@naver.com'), //필수 입력 사항
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/test_image2.jpg'),
              ),
              onDetailsPressed: () {
                //리스트 뷰 화면에서 화살표 모양의 오른쪽 버튼
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  //사용자 계정 이미지(위쪽 하늘색 부분)
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                    //사각형 이미지의 아래쪽 둥글게
                    bottomLeft: Radius.circular(40.0), //40.0은 둥글게 만들어주는 상수 값
                    bottomRight: Radius.circular(40.0),
                  )),
            ),
            ListTile(
              //왼쪽 끝에 아이콘 배치한 리스트
              leading: Icon(Icons.home, color: Colors.grey),
              title: Text('Home'),
              onTap: () {
                //두번 터치 or 쭉 눌렀을때 이벤트 발생
                print('Home is clicked.');
              },
              trailing: Icon(Icons.add), //trailing - 오른쪽 끝에 배치하는것
            ),
            ListTile(
              //왼쪽 끝에 아이콘 배치한 리스트
              leading: Icon(Icons.settings, color: Colors.grey),
              title: Text('Setting'),
              onTap: () {
                //두번 터치 or 쭉 눌렀을때 이벤트 발생
                print('Setting is clicked.');
              },
              trailing: Icon(Icons.add), //trailing - 오른쪽 끝에 배치하는것
            ),
            ListTile(
              //왼쪽 끝에 아이콘 배치한 리스트
              leading: Icon(Icons.question_answer, color: Colors.grey),
              title: Text('Q&A'),
              onTap: () {
                //두번 터치 or 쭉 눌렀을때 이벤트 발생
                print('Q&A is clicked.');
              },
              trailing: Icon(Icons.add), //trailing - 오른쪽 끝에 배치하는것
            ),
            ElevatedButton(
              child: Text('스낵바 버튼'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Flutter3.0 Snack method test'))); //onPressed에 세미콜론!!!!
              },
            )
          ],
        ),
      ),

      backgroundColor: Color.fromARGB(255, 210, 255, 105),
      body: Padding(
        //Padding은 위치 조절 가능, Center는 중앙, 옆에 전구 눌러서 수정해도된다
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        //LTAB에서부터위치 (left,top,right,bottom)

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //가로축 정렬을 위한 위젯
          children: [
            Text(
              'Name',
              style: TextStyle(
                color: Color.fromARGB(255, 71, 17, 158),
                letterSpacing: 2.0, //글씨의 간격
              ),
            ),
            SizedBox(
              //텍스트 사이에 안보이는 박스를 넣어서 간격 조정
              height: 10.0,
            ),
            Text(
              'Thomas',
              style: TextStyle(
                  color: Color.fromARGB(255, 71, 17, 158),
                  letterSpacing: 3.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/test_image1.jpg'),
                radius: 80.0,
                backgroundColor: Colors.black,
              ),
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                //위젯 중 하나, Ctrl + Space로 체크 가능
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Capstone Design',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
              ],
            ),
            Center(
              child: Image(
                image: AssetImage('assets/test_image2.jpg'),
                width: 100.0, //크기 조정, 하드 코딩방식이라 화면 크기가 달라지면 이상해짐
              ),
            ),
            Divider(
              //구분선
              height: 60.0, //위아래 30씩 거리조절
              color: Colors.grey,
              thickness: 0.5, //두께
              endIndent: 30.0, //끝에서 부터 어느정도 떨어질 것인지 설정
            ),
            Row(children: <Widget>[
              Expanded(
                  //Expanded 클래스를 이용, 자동으로 크기 조정
                  child: Image(
                image: AssetImage('assets/test_image1.jpg'),
              )),
              Expanded(
                  //Expanded 클래스를 이용, 자동으로 크기 조정
                  child: Image(
                image: AssetImage('assets/test_image2.jpg'),
              ))
            ])
          ],

          // mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>[
          //   const Text(
          //     'You have pushed the button this many times:',
          //   ),
          //   Text(
          //     '$_counter',
          //     style: Theme.of(context).textTheme.headline4,
          //   ),
          // ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

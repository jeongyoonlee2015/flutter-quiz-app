import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size; //mediaquery의 장점:
  double width = screenSize.width;
  double height = screenSize.height; // 상대수치 활용하겠다는 것

  return SafeArea( //기기의 상단 노티 바 부분, 하단 영역을 침범하지 않는 안전한 영역을 잡아주는 위젯
    child: Scaffold (
      appBar: AppBar(
        title: Text('My Quiz App'),
        backgroundColor: Colors.deepPurple,
        leading: Container(),//leading 빈 container: 앱 바 좌측 버튼을 지우는 효과
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/quiz.jpeg', width: width * 0.8,
            ),
          )
        ],
      ),
      ),
    );
  }
}



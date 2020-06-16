import 'package:flutter/material.dart';
import 'package:quizapptest/model/model_quiz.dart';
import 'package:quizapptest/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
    'title':'test',
    'candidates':['a','b','c','d'],
      'answer':0
    }),
    Quiz.fromMap({
      'title':'test',
      'candidates':['a','b','c','d'],
      'answer':0
    }),
    Quiz.fromMap({
      'title':'test',
      'candidates':['a','b','c','d'],
      'answer':0
    }),
  ];
  @override
  Widget build(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size; //mediaquery의 장점:
  double width = screenSize.width;
  double height = screenSize.height; // 상대수치 활용하겠다는 것

  return WillPopScope( //얘도 screen_result처럼 이상한데 안돌아가도록
      onWillPop: () async => false,
      child: SafeArea( //기기의 상단 노티 바 부분, 하단 영역을 침범하지 않는 안전한 영역을 잡아주는 위젯
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
                  'images/quiz.jpeg',
                  width: width * 0.8,
            ),
          ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
          ),
            Text(
              '플러터 퀴즈 앱',
              style: TextStyle(
                fontSize: width*0.065,
                fontWeight: FontWeight.bold,
              ),
          ),
            Text(
              '퀴즈를 풀기 전 안내사항입니다. \n 꼼꼼히 읽고 퀴즈 풀기를 눌러주세요 :) ',
              textAlign: TextAlign.center,
          ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
          ),
            _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
            _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤 \n다음 문제 버튼을 눌러주세요.'),
            _buildStep(width, '3. 1등에 도전해보세요!'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
          ),
            Container(
              padding: EdgeInsets.only(bottom: width = 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape:
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10)
                  ),
                  child: RaisedButton(
                    child: Text(
                      ' 지금 퀴즈 풀기 ',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(quizs: quizs,)
                          )//onpressed가 제대로 선언된 것을 확인할 수 있다.
                      );
                    },//일단 빈 형태로
                ),
              ),
            ),
          ),
          ],
          ),
        ),
      ),
    );
  }
  Widget _buildStep(double width, String title){
    return Container(
      padding: EdgeInsets.fromLTRB(
        width = 0.048,
        width = 0.024,
        width = 0.048,
        width = 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.check_box, size: width * 0.04
          ),
          Padding(padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}



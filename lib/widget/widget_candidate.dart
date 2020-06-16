import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget{
  VoidCallback tap; //CnadWidget을 사용하는 부모 위젯에서 지정한 onTap을 전달해주는 기
  String text;
  int index;
  double width;
  bool answerState;

  CandWidget({this.tap, this.index, this.width, this.text, this.answerState});
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState  extends State<CandWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(widget.width * 0.048, widget.width * 0.024, widget.width * 0.048, widget.width * 0.024),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple),
        color: widget.answerState ? Colors.deepPurple : Colors.white // 선택지가 선택되면 보라색 선택 안되면 하얀색
      ),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width * 0.035,
            color: widget.answerState ? Colors.white : Colors.black,
          )
        ),
        onTap: (){
          setState(() {
            widget.tap();
            widget.answerState = !widget.answerState;
          });
        },
      ),
    );
  }
}
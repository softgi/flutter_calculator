import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//앱실행
void main() => runApp(const MyApp());

//상태 변화가 없는 위젯, 한번 UI가 그려지면 그대로 있다.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //UI를 만드는 부분
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      //화면에 보여지는 내용
      home: CalculatorForm(title:"계산"),
    );
  }
}

//상태 변화가 가능한 위젯
class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorFormState createState() => _CalculatorFormState();
}


//실질적으로 widget 을 구현하는 곳
class _CalculatorFormState extends State<CalculatorForm> {

  //text 입력값을 들고오기
  final myFirstText = TextEditingController();
  final mySecondText = TextEditingController();

  void _zero() {
    myFirstText.text= '';
    mySecondText.text = '';
  }

  void _plus() {
    var a = double.parse(myFirstText.text);
    var b = double.parse(mySecondText.text);
    myFirstText.text = '${a+b}';
    mySecondText.text = '';
  }

  void _minus() {
    var a = double.parse(myFirstText.text);
    var b = double.parse(mySecondText.text);
    myFirstText.text = '${a-b}';
    mySecondText.text = '';
  }

  void _division() {
    var a = double.parse(myFirstText.text);
    var b = double.parse(mySecondText.text);
    myFirstText.text = '${a/b}';
    mySecondText.text = '';
  }

  void _multiply() {
    var a = double.parse(myFirstText.text);
    var b = double.parse(mySecondText.text);
    myFirstText.text = '${a*b}';
    mySecondText.text = '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //상단에 들어갈 내용
      appBar: AppBar(
        title: const Text('계산기'),
      ),
      body: Padding(
        //사이즈
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              //숫자만 입력가능하게 만들기
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
              decoration: const InputDecoration(
                hintText: "값을 입력해주세요"
              ),
              controller: myFirstText,

            ),
            TextField(
              //숫자 자판
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
              decoration: const InputDecoration(
                  hintText: "값을 입력해주세요",
              ),
              controller: mySecondText,
            ),
            Container(
              child: Row(
                //가로 정렬, 세로로 정렬할려면 crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: _zero,
                    child: const Text('C',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      )
                    ),
                  ),
                  TextButton(onPressed: _plus,
                    child: const Text('＋',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      )
                    ),
                  ),
                  TextButton(onPressed: _minus,
                    child: const Text('－',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      )
                    ),
                  ),
                  TextButton(onPressed: _division,
                    child: const Text('÷',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    ),
                  ),
                  TextButton(onPressed: _multiply,
                    child: const Text('×',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
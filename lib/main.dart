import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: CalculatorForm(title:"계산"),
    );
  }
}

// Define a custom Form widget.
class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorFormState createState() => _CalculatorFormState();
}


// Define a corresponding State class.
// This class holds data related to the Form.
class _CalculatorFormState extends State<CalculatorForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

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
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
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
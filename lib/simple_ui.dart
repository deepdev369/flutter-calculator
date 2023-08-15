import 'package:calculator/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

String historyString = '';
//String second = '';
String result = '';
String equation = "";
String resultString = "";
//String current = "";
final List<String> array = ['1','2','3','4','5','6','7','8','9','0'];


class simpleCalculator extends StatelessWidget {
  const simpleCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Display(),
        ],
      ),
    );
  }
}


// Custom statefull widget to display the calculations
class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  //defining all the important variables

  buttonPressed(String buttonData) {
    
    setState(() {
      if(array.contains(buttonData)){
        if (result == resultString) {
        resultString = '';
      }
      }
      if (buttonData == 'C') {
        resultString = "";
        //equation = equation + resultString;
      } else if (buttonData == "⌫") {
        resultString = resultString.substring(0, resultString.length - 1);
      } else if (buttonData == "=") {
        equation = "$resultString=";
        try {
          Parser p = Parser();
          Expression exp = p.parse(resultString);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {}  
        resultString = result;
        historyString = "$historyString\n\n\n$equation$resultString";
      } else {
        resultString = resultString + buttonData;
      }
      //Parser p = Parser();
      resultString.replaceAll('÷', '/');
      resultString.replaceAll('×', '*');
      resultString.replaceAll('-', '-');
      //Expression exp = p.parse(resultString);
    });
  }

  // ignore: non_constant_identifier_names
  Widget DPButton(
      {Color buttonColor = Colors.black,
      required String face,
      required double width,
      required double height}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          width, //setting the width of the button
      height: MediaQuery.of(context).size.height *
          height, //setting the height of the button
      child: ElevatedButton(
        onPressed: () {
          if (face == "( )") {
            buttonPressed("(");
          } else {
            buttonPressed(face);
          }
        },
        onLongPress: () {
          if (face == "( )") {
            buttonPressed(")");
          } else {
            buttonPressed(face);
          }
        },
        style: ButtonStyle(
          //styling the button
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              //shaping the button
              borderRadius: BorderRadius.all(Radius.zero),
              side: BorderSide(
                color: Color.fromARGB(255, 0, 0, 0), //border color
              ))),
        ),
        child: Text(
          face,
          style: const TextStyle(
            //styling the font
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    history(historyString: historyString)),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.black,
                            ),
                            shape: MaterialStateProperty.all(
                                const CircleBorder())),
                        child: const Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        equation,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                  Text(
                    resultString,
                    style: const TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ]),
          ),
        ),
        SizedBox(
          child: Table(
            children: [
              TableRow(children: [
                DPButton(
                  face: 'C',
                  buttonColor: const Color.fromARGB(255, 255, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '⌫',
                  buttonColor: const Color.fromARGB(255, 10, 10, 10),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '/',
                  buttonColor: const Color.fromARGB(255, 10, 10, 10),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '*',
                  buttonColor: const Color.fromARGB(255, 10, 10, 10),
                  width: .25,
                  height: .14,
                ),
              ]),
              TableRow(children: [
                DPButton(
                  face: '7',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '8',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '9',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '-',
                  buttonColor: const Color.fromARGB(255, 10, 10, 10),
                  width: .25,
                  height: .14,
                ),
              ]),
              TableRow(children: [
                DPButton(
                  face: '4',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '5',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '6',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '+',
                  buttonColor: const Color.fromARGB(255, 10, 10, 10),
                  width: .25,
                  height: .14,
                ),
              ]),
              TableRow(children: [
                DPButton(
                  face: '1',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '2',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '3',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '%',
                  buttonColor: const Color.fromARGB(255, 10, 10, 10),
                  width: .25,
                  height: .14,
                ),
              ]),
              TableRow(children: [
                DPButton(
                  face: '.',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '0',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '( )',
                  buttonColor: const Color.fromARGB(255, 0, 0, 0),
                  width: .25,
                  height: .14,
                ),
                DPButton(
                  face: '=',
                  buttonColor: const Color.fromARGB(255, 255, 0, 0),
                  width: .25,
                  height: .14,
                ),
              ])
            ],
          ),
        )
      ],
    );
  }
}

//this is a comment

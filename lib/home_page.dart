import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import './buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  Color setButtonColor(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return Colors.amber[700]!;
    }
    if (x == '%' || x == 'DEL' || x == 'C') {
      return Colors.grey[400]!;
    }
    return Colors.grey[800]!;
  }

  Color setButtonTextColor(String x) {
    if (x == '%' || x == 'DEL' || x == 'C') {
      return Colors.black;
    }
    return Colors.white;
  }

  void equalBtnPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          children: [
            // Screen section
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Number pad section
            Expanded(
              flex: 2,
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (ctx, index) {
                    // clear button
                    if (index == 0) {
                      return MyButton(
                        color: setButtonColor(buttons[index]),
                        textColor: setButtonTextColor(buttons[index]),
                        buttonText: buttons[index],
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                      );
                    }
                    // Del button
                    else if (index == 1) {
                      return MyButton(
                        color: setButtonColor(buttons[index]),
                        textColor: setButtonTextColor(buttons[index]),
                        buttonText: buttons[index],
                        buttonTapped: () {
                          if (userQuestion.length > 0) {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          }
                        },
                      );
                    }
                    // Equal button
                    else if (index == buttons.length - 1) {
                      return MyButton(
                          color: setButtonColor(buttons[index]),
                          textColor: setButtonTextColor(buttons[index]),
                          buttonText: buttons[index],
                          buttonTapped: () {
                            setState(() {
                              equalBtnPressed();
                            });
                          });
                    }
                    return MyButton(
                      color: setButtonColor(buttons[index]),
                      textColor: setButtonTextColor(buttons[index]),
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

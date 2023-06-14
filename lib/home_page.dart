import 'package:flutter/material.dart';

import './buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
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
                    return MyButton(
                      color: setButtonColor(buttons[index]),
                      textColor: setButtonTextColor(buttons[index]),
                      buttonText: buttons[index],
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

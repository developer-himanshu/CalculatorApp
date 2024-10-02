// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:calculator_app/Components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
// result show krne ke liye ek column aur banaenge
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              userInput.toString(),
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            answer.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '+/-',
                            onPress: () {
                              userInput = '${userInput}0';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            onPress: () {
                              userInput = '$userInput%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userInput = '$userInput/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userInput = '${userInput}7';
                            // userInput=userInput+7;
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '8',
                            onPress: () {
                              userInput = '${userInput}8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '0',
                            onPress: () {
                              userInput = '${userInput}0';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userInput = '${userInput}x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userInput = '${userInput}4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '5',
                            onPress: () {
                              userInput = '${userInput}5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            onPress: () {
                              userInput = '${userInput}6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userInput = '$userInput-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userInput = '${userInput}1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '2',
                            onPress: () {
                              userInput = '${userInput}2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            onPress: () {
                              userInput = '${userInput}3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userInput = '$userInput+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            userInput = '${userInput}0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '.',
                            onPress: () {
                              userInput = '$userInput.';
                              setState(() {});
                            }),
                        MyButton(title: 'DEL', onPress: () {
                          userInput =userInput.substring(0, userInput.length-1);
                          setState(() {
                            
                          });
                        }),
                        MyButton(
                            title: '=',
                            color: Color(0xffffa00a),
                            onPress: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // equal ka function bna rhe hai
// math expression add krenge pub.dev se
  void equalPress() {
                          String finalUserInput=userInput;
                          finalUserInput=userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/component/uitilize1.dart';
import 'package:flutter_ui/model/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

List<QuestionModel> question = [
  QuestionModel(question: 'How old Are you?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '22', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '23', isCorrect: true),
  ]),
  QuestionModel(question: 'How old Are you?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '22', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '23', isCorrect: true),
  ]),
  QuestionModel(question: 'How old Are you?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '22', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '23', isCorrect: true),
  ]),
  QuestionModel(question: 'How old Are you?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '22', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '23', isCorrect: true),
  ]),
  QuestionModel(question: 'How old Are you?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '22', isCorrect: false),
    AnswerModel(answer: '25', isCorrect: false),
    AnswerModel(answer: '23', isCorrect: true),
  ]),
];

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

int positiveScore = 0;
int negativeScore = 0;
num answerTime = 0;
bool visible = true;
PageController controller = PageController();

class _QuizPageState extends State<QuizPage> with UitlityComponent {
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        answerTime++;
        if (answerTime > 20) {
          answerTime = 0;
          negativeScore++;
          controller.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.linear);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: question.length,
        controller: controller,
        itemBuilder: (context, index) => Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 380,
                    color: Colors.white,
                  ),
                  Container(
                    width: 337,
                    height: 228,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(164, 47, 193, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                  Positioned(
                    top: 16,
                    left: 207,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 0.10)),
                    ),
                  ),
                  Positioned(
                    top: 88,
                    left: 279,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 0.10)),
                    ),
                  ),
                  Positioned(
                    top: -34,
                    left: 78,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 0.10)),
                    ),
                  ),
                  Positioned(
                    top: 69,
                    left: -45,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 0.10)),
                    ),
                  ),
                  Positioned(
                    top: 143,
                    left: 28,
                    child: Stack(
                      children: [
                        Container(
                          width: 281,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: List.filled(
                                1,
                                const BoxShadow(
                                    blurRadius: 5,
                                    color: Color.fromARGB(255, 248, 225, 242),
                                    offset: Offset(0, 2),
                                    spreadRadius: 0.5),
                                growable: true),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                          top: 11,
                          left: 10,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: Text(
                                  positiveScore.toString(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(31, 132, 53, 1),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                height: 8,
                                width: 2 + (6 * positiveScore.toDouble()),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(31, 132, 53, 1),
                                    borderRadius: BorderRadius.circular(15)),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 11,
                          left: 260,
                          child: Text(
                            negativeScore.toString(),
                            style: const TextStyle(
                                color: Color.fromRGBO(208, 90, 4, 1),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Positioned(
                          top: 18.5,
                          left: 250,
                          child: Transform.translate(
                            offset: Offset(-6 * negativeScore.toDouble(), 0),
                            child: Container(
                              height: 8,
                              width: 2 + (6 * negativeScore.toDouble()),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(208, 90, 4, 1),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 108,
                    child: Container(
                      width: 67,
                      height: 67,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Text(
                          answerTime.toString(),
                          style: const TextStyle(
                              color: Color.fromRGBO(164, 47, 193, 1),
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 149,
                    top: 117,
                    // bottom: 138,
                    child: Container(
                      width: 49,
                      height: 49,
                      decoration: const BoxDecoration(
                          color: Colors.transparent, shape: BoxShape.circle),
                      child: CircularProgressIndicator(
                        value: answerTime / 20,
                        color: const Color.fromRGBO(164, 47, 193, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 189,
                    left: 120,
                    child: Text(
                      'Question ${index + 1}/${question.length}',
                      style: const TextStyle(
                          color: Color.fromRGBO(164, 47, 193, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    left: 44,
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        question[index].question,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, ind) => InkWell(
                      onTap: () {
                        visible = false;

                        checkoutAnswer(question[index].answers[ind].isCorrect,
                            context, question[index].time, answerTime);
                        answerTime = 0;
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 21),
                            child: Container(
                              width: 240,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(164, 47, 193, 1),
                                      width: 2)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 21),
                                    child: Text(
                                      question[index].answers[ind].answer,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 12,
                                      child: Visibility(
                                        visible: visible,
                                        replacement: CircleAvatar(
                                          backgroundColor: Colors.grey.shade100,
                                          radius: 11,
                                          backgroundImage: AssetImage(
                                              question[index]
                                                      .answers[ind]
                                                      .isCorrect
                                                  ? 'asset/true.png'
                                                  : 'asset/false.png'),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey.shade200,
                                          radius: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

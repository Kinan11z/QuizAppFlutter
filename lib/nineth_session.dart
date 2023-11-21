import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/component/uitilize.dart';
import 'package:flutter_ui/model/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: const Text('Warning!'),
            //   duration: const Duration(seconds: 4),
            //   backgroundColor: Colors.amber,
            //   dismissDirection: DismissDirection.endToStart,
            //   behavior: SnackBarBehavior.floating,
            //   showCloseIcon: true,
            //   elevation: 0,
            //   action: SnackBarAction(
            //     label: 'Show',
            //     onPressed: () {
            //       // Navigator.pop(context);
            //     },
            //     // textColor: Colors.white,
            //   ),
            // ));
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                ),
              ),
            );
          },
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

int score = 0;
num answerTime = 0;
PageController controller = PageController();

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> with UitlityComponent {
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 500,
        child: PageView.builder(
            itemCount: question.length,
            controller: controller,
            itemBuilder: (context, index) => Scaffold(
                  appBar: AppBar(
                    title: Text(score.toString()),
                    centerTitle: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, right: 30),
                        child: Text(
                          answerTime.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  body: Column(children: [
                    ListTile(title: Text(question[index].question)),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: question[index].answers.length,
                        itemBuilder: (context, ind) => InkWell(
                          onTap: () {
                            checkoutAnswer(
                                question[index].answers[ind].isCorrect,
                                context,
                                question[index].time,
                                answerTime);
                            answerTime = 0;
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 17, child: Text((ind + 1).toString())),
                            title: Text(question[index].answers[ind].answer),
                          ),
                        ),
                      ),
                    )
                  ]),
                )),
      ),
    );
  }
}

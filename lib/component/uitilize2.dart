import 'package:flutter/material.dart';
import 'package:flutter_ui/homeWork10.dart';
import 'package:flutter_ui/homeWork6.dart';
import 'package:flutter_ui/model/question.dart';

TextEditingController controller1 = TextEditingController();

mixin UitlityComponent {
  checkoutAnswer(
      bool isCorrect, BuildContext context, num time, num answerTime) async {
    if (time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Time Out'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
      controller.nextPage(
          duration: const Duration(seconds: 3), curve: Curves.linear);
    } else {
      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Success'),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.green),
        );

        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            height: 500,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 20, right: 20, bottom: 20),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: controller1,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Quesetion',
                          labelText: 'Your Quesetion'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: const Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(10),
                          //   child: SizedBox(
                          //     height: 50,
                          //     child: TextField(
                          //       controller: controller2,
                          //       decoration: InputDecoration(
                          //           border: OutlineInputBorder(),
                          //           hintText: 'Right Answer',
                          //           labelText: 'Right Answer'),
                          //     ),
                          //   ),
                          // ),
                          TwoShowModal(),
                        ],
                      ),
                    ),
                  ),
                  child: Container(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(164, 47, 193, 1)),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        positiveScore++;
        visible = true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Field'),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.red,
          ),
        );
        await Future.delayed(const Duration(seconds: 1));
        controller.nextPage(
            duration: const Duration(seconds: 3), curve: Curves.linear);
        if (next == question.length - 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstWidget(),
            ),
          );
        }
        negativeScore++;
        visible = true;
      }
    }
  }
}
int count = 1;
late List<QuestionModel> question1;

class TwoShowModal extends StatefulWidget {
  const TwoShowModal({super.key});

  @override
  State<TwoShowModal> createState() => _TwoShowModalState();
}

class _TwoShowModalState extends State<TwoShowModal> {
  late List<TextEditingController> controller2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 310,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: count,
            itemBuilder: (context, index) {
              controller2 =
                  List.generate(count, (index) => TextEditingController());
              return Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controller2[index],
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText:
                            index == 0 ? 'Right Answer ' : "Answer${index + 1}",
                        labelText: index == 0
                            ? 'Right Answer '
                            : "Answer${index + 1}"),
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                controller.nextPage(
                    duration: const Duration(seconds: 3), curve: Curves.linear);

                question.addAll(List.generate(
                  1,
                  (index) => QuestionModel(
                      question: controller1.text,
                      time: 20,
                      answers: List.generate(
                        count,
                        (index) => AnswerModel(
                            answer: controller2[index].text,
                            isCorrect: index == 0 ? true : false),
                      )),
                ));
                print(question);
                if (next == question.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstWidget(),
                    ),
                  );
                }
              },
              child: Container(
                width: 60,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(164, 47, 193, 1)),
                child: const Text(
                  'ADD',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  count++;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  )),
            ),
          ],
        )
      ],
    );
  }
}

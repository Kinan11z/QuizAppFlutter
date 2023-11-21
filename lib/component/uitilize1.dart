import 'package:flutter/material.dart';
import 'package:flutter_ui/homeWork9.dart';

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
        await Future.delayed(const Duration(seconds: 1));
        controller.nextPage(
            duration: const Duration(seconds: 3), curve: Curves.linear);
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
        negativeScore++;
        visible = true;
      }
    }
  }
}

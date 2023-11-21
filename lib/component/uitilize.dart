import 'package:flutter/material.dart';
import 'package:flutter_ui/nineth_session.dart';

mixin UitlityComponent {
  checkoutAnswer(
      bool isCorrect, BuildContext context, num time, num answerTime) {
    if (time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Time Out'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
      controller.nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
    } else {
      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Success'),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.green),
        );
        controller.nextPage(
            duration: Duration(seconds: 1), curve: Curves.linear);
        score++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Field'),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.red,
          ),
        );
        controller.nextPage(
            duration: Duration(seconds: 1), curve: Curves.linear);
        score--;
      }
    }
  }
}

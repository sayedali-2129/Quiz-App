import 'package:flutter/material.dart';
import 'package:quiz_app/view/homeScreen/questions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Quiz Time"),
        ),
        body: QuestionsPage());
  }
}

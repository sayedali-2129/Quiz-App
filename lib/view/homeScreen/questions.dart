import 'package:flutter/material.dart';
import 'package:quiz_app/dataBase/database.dart';
import 'package:quiz_app/utils/Image%20constant/imageconstant.dart';
import 'package:quiz_app/view/scorepage/score_page.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int? checkValue;

  int value = 0;
  void count() {
    value = value + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.quizLogo),
                    fit: BoxFit.cover)),
          ),
          Text(
            DataBase.quizData[value]["question"],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                checkValue = index;
                setState(() {});
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: checkValue == index
                        ? checkValue == DataBase.quizData[value]["answer"]
                            ? Colors.green
                            : Colors.red
                        : Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    DataBase.quizData[value]["option"][index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              count();
              checkValue = 5;

              setState(() {
                if (value < DataBase.quizData.length) {
                  value;
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ScorePage()));
                }
              });
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

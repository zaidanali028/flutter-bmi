import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bottomBtn.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String healthStatus;
  final String BMI;
  final String healthStatusDetail;

  ResultsPage({
    @required this.healthStatus,
    @required this.BMI,
    @required this.healthStatusDetail,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF0A0E21),
        appBar: AppBar(
          backgroundColor: Color(0XFF0E21),
          centerTitle: true,
          title: Text('BMI CALCULATOR '),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Your Results',
                      style: TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.w900)),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: ResultCard(
                  healthStatus: healthStatus,
                  BMI: BMI,
                  healthStatusDetail: healthStatusDetail,
                )),
            Expanded(
                child: CalcBtn(
              btText: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            )),
          ],
        )));
  }
}

class ResultCard extends StatelessWidget {
  final String healthStatus;
  final String BMI;
  final String healthStatusDetail;

  ResultCard({
    @required this.healthStatus,
    @required this.BMI,
    @required this.healthStatusDetail,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Expanded(child: Text(healthStatus, style: khealthStatStyle)),
            Expanded(child: Text(BMI, style: kNumResultStyle)),
            Expanded(child: Text(healthStatusDetail, style: kHealthDetail)),
          ],
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0XFF111328), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_score_bar/fl_score_bar.dart';
import 'package:quiz_final/utility/card_details.dart';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_final/components/reusable_widgets.dart';
import 'package:quiz_final/extension/context_extension.dart';
import 'package:quiz_final/screens/main_class.dart';


class ScoreScreen extends StatelessWidget {
  final int score;
  final int index;
  const ScoreScreen({Key? key, required this.score, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[index].gradients,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconScoreBar(
              scoreIcon: Icons.star_rounded,
              iconColor: Colors.yellow,
              score: score / 3,
              maxScore: 3,
              readOnly: true,
            ),
            const SizedBox(height: 30),
            Text(
              '${score.toString()}/10',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterGameScreen(score: score)));
              },
              child: Container(
                width: 0.3 * MediaQuery.of(context).size.width,
                height: 0.08 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 3),
                      blurRadius: 0.7,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.exit_to_app,
                  color: cardDetailList[index].textColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class AfterGameScreen extends StatefulWidget {
  final int score;

  const AfterGameScreen({Key? key, required this.score}) : super(key: key);

  @override
  State<AfterGameScreen> createState() => _AfterGameScreenState();
}

class _AfterGameScreenState extends State<AfterGameScreen> {
  late double correctNumber;
  bool isPlaying = false;
  late ConfettiController _controllerTopCenter;

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  void initState() {
    correctNumber = widget.score / 10;
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 5));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int correctNumberInt = correctNumber.toInt();

    setState(() {
      _controllerTopCenter.play();
    });

    return MaterialApp(
      home: Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
            ),
            backgroundColor: Color(0xff14154F),
            body: Padding(padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  Center(
                      child: Column(
                        children: [
                          Text(
                            "Congratulations!",
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                color: Color(0xffFFBA07),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(top: context.dynamicHeight(0.05)),
                            child: CircleAvatar(
                              backgroundImage: Image.asset("lib/assets/images/kupa.png").image,
                              backgroundColor: Color(0xff5A88B0),
                              radius: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: context.dynamicWidth(0.4),
                                  height: context.dynamicHeight(0.15),
                                  child: Card(
                                    color: Color(0xff14154F),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: BorderSide(
                                            color: Color(0xffFF5ED2), width: 3)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.score.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                              color: Color(0xffFF5ED2),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Score",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                              color: Color(0xffFF5ED2),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: context.dynamicHeight(0.12),
                              width: context.dynamicWidth(0.8),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                                },
                                child: Card(
                                  color: Color(0xff26CE55),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "Home Page",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          ConfettiWidget(
            numberOfParticles: 50,
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: _controllerTopCenter,
          )
        ],
      ),
    );
  }
}


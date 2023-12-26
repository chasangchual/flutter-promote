import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // final int goalOfRound = 12;
  // final int countOfRounds = 0;
  // final int roundOfRuns = 4;
  // final int countOfRuns = 0;
  // State state = State.STOPPED;
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenSate();
}

class _HomeScreenSate extends State<HomeScreen> {
  late Timer timer;
  int goalCycle = 4;
  int cycle = 0;

  int goalRound = 12;
  int round = 0;

  bool isRunning = false;
  int timerDuration = 25;
  int totalSeconds = 25 * 60;
  int timerMin = 25;
  int timerSec = 0;
  void onTick(Timer timer) {
    setState(() {
      if (isRunning) {
        totalSeconds = totalSeconds - 1;
        timerMin = (totalSeconds / 60).floor();
        timerSec = totalSeconds % 60;
      }

      if (totalSeconds == 0) {
        isRunning = false;
        cycle = cycle + 1;
        if (cycle == goalCycle) {
          cycle = 0;
          round = round + 1;
        }
      }
      print(isRunning);
      print(totalSeconds);
    });
  }

  void onStartPressed() {
    isRunning = true;
    timer = Timer.periodic(Duration(seconds: 1), onTick);
    setState(() {});
  }

  void onPausePressed() {
    isRunning = false;
    timer.cancel();
    setState(() {});
  }

  void onTimeSelected15() {
    refreshTimer(15);
  }

  void onTimeSelected20() {
    refreshTimer(20);
  }

  void onTimeSelected25() {
    refreshTimer(25);
  }

  void onTimeSelected30() {
    refreshTimer(30);
  }

  void onTimeSelected35() {
    refreshTimer(35);
  }

  String paddingZero(int value) {
    if (value > 9) {
      return value.toString();
    }
    return '0' + value.toString();
  }

  void refreshTimer(int newDuration) {
    timerDuration = newDuration;
    totalSeconds = timerDuration * 60;
    timerMin = (totalSeconds / 60).floor();
    timerSec = totalSeconds % 60;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Flexible(
              flex: 3,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    color: Colors.white,
                    child: Text(
                      paddingZero(timerMin),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  )),
                  Container(
                    child: Text(
                      ":",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    color: Colors.white,
                    child: Text(
                      paddingZero(timerSec),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  )),
                  SizedBox(
                    width: 30,
                  ),
                ],
              )),
          SizedBox(
            height: 70,
          ),
          Flexible(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(width: 3, color: Colors.white),
                      padding: const EdgeInsets.all(10),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onTimeSelected15,
                    child: Text(
                      "15",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )),
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(width: 3, color: Colors.white),
                      padding: const EdgeInsets.all(10),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onTimeSelected20,
                    child: Text(
                      "20",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )),
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(width: 3, color: Colors.white),
                      padding: const EdgeInsets.all(10),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onTimeSelected25,
                    child: Text(
                      "25",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )),
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(width: 3, color: Colors.white),
                      padding: const EdgeInsets.all(10),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onTimeSelected30,
                    child: Text(
                      "30",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )),
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(width: 3, color: Colors.white),
                      padding: const EdgeInsets.all(10),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onTimeSelected35,
                    child: Text(
                      "35",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )),
                ],
              )),
          SizedBox(
            height: 50,
          ),
          Flexible(
              flex: 3,
              child: Center(
                child: IconButton(
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(isRunning ? Icons.stop_circle_outlined : Icons.play_circle_outlined),
                  iconSize: 120,
                  color: Colors.white,
                ),
              )),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${cycle}/${goalCycle}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "ROUND",
                          style: Theme.of(context).textTheme.displayMedium,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${round}/${goalRound}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "GOAL",
                          style: Theme.of(context).textTheme.displayMedium,
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_chat/homepage.dart';
import 'package:flutter/material.dart';

class Friend extends StatefulWidget {
  const Friend({super.key});

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  List sq = ["", "", "", "", "", "", "", "", ""];
  String first = "X";
  String winnerPlayer = "";
  int xScore = 0, oScore = 0, drawScore = 0;
  bool isPlay = true;
  bool isWin = false;
  getWinner() {
    List winIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var i = 0; i < winIndex.length; i++) {
      String a = sq[winIndex[i][0]];
      String b = sq[winIndex[i][1]];
      String c = sq[winIndex[i][2]];
      if (a == b && b == c && a != "") {
        return a;
      }
    }
    if (!sq.contains("")) {
      return "Draw";
    }
    return "";
  }

  clearBoard() {
    setState(() {
      for (var i = 0; i < sq.length; i++) {
        sq[i] = "";
      }
    });
  }

  Timer? timer;

  startTimer() {
    setState(() {
      isPlay = false;
      isWin = true;
    });
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        clearBoard();
        setState(() {
          isPlay = true;
          isWin = false;
        });
        timer.cancel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.deepPurpleAccent,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Colors.black,
                          )),
                      Text(
                        'VS FRiEND',
                        style: TextStyle(fontFamily: "frist", fontSize: 44),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              clearBoard();
                              xScore = 0;
                              oScore = 0;
                              drawScore = 0;
                              first = "X";
                            });
                          },
                          icon: Icon(
                            Icons.restart_alt_outlined,
                            size: 40,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'X',
                              style: TextStyle(
                                  color: (first == 'X')
                                      ? Colors.black
                                      : Colors.deepPurple,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "frist"),
                            ),
                            Text(
                              'SCROR',
                              style: TextStyle(
                                  color: (first == 'X')
                                      ? Colors.black
                                      : Colors.deepPurple,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "frist"),
                            ),
                            Text(
                              '${xScore}',
                              style: TextStyle(
                                  color: (first == 'X')
                                      ? Colors.black
                                      : Colors.deepPurple,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "second"),
                            ),
                          ],
                        ),
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(
                          color: (first == 'X')
                              ? Color.fromARGB(255, 221, 87, 245)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Draw: ${drawScore}',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "second"),
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        height: 60,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'O',
                              style: TextStyle(
                                  color: (first == 'O')
                                      ? Colors.black
                                      : Colors.deepPurple,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "frist"),
                            ),
                            Text(
                              'SCROR',
                              style: TextStyle(
                                  color: (first == 'O')
                                      ? Colors.black
                                      : Colors.deepPurple,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "frist"),
                            ),
                            Text(
                              '${oScore}',
                              style: TextStyle(
                                  color: (first == 'O')
                                      ? Colors.black
                                      : Colors.deepPurple,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "second"),
                            ),
                          ],
                        ),
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(
                          color: (first == 'O')
                              ? Color.fromARGB(255, 221, 87, 245)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Now is Time for ${first}',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "second",
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        height: 420,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, crossAxisSpacing: 0),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (sq[index] == "" && isPlay) if (first ==
                                    "X") {
                                  sq[index] = "X";
                                  winnerPlayer = getWinner();
                                  if (winnerPlayer == "X") {
                                    xScore++;
                                    first = "X";
                                    startTimer();
                                  } else if (winnerPlayer == "O") {
                                    oScore++;
                                    first = "O";
                                    startTimer();
                                  } else if (winnerPlayer == "Draw") {
                                    drawScore++;
                                    startTimer();
                                  } else {
                                    first = "O";
                                  }
                                } else {
                                  sq[index] = "O";
                                  winnerPlayer = getWinner();
                                  if (winnerPlayer == "X") {
                                    xScore++;
                                    first = "X";
                                    startTimer();
                                  } else if (winnerPlayer == "O") {
                                    oScore++;
                                    first = "O";
                                    startTimer();
                                  } else if (winnerPlayer == "Draw") {
                                    drawScore++;
                                    startTimer();
                                  } else {
                                    first = "X";
                                  }
                                }
                              });
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                sq[index],
                                style: TextStyle(
                                    fontSize: 50, fontFamily: "frist"),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.black, width: 5),
                              ),
                            ),
                          ),
                          itemCount: sq.length,
                        )),
                  )
                ],
              ),
              if (isWin)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          winnerPlayer == "Draw"
                              ? "Draw"
                              : "${winnerPlayer} Is Win",
                          style: TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: "frist"),
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

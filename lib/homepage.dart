import 'package:firebase_chat/computer.dart';
import 'package:firebase_chat/friend.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurpleAccent,
            Color.fromARGB(255, 92, 4, 243)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'XO GAME',
              style: TextStyle(fontSize: 60, fontFamily: "frist"),
            ),
            Text(
              'TIC TAC TOE',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "second"),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/image/x_o.jpeg'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Friend()));
              },
              child: Text(
                'Paly VS Friend',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "second"),
              ),
              style:
                  ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(290, 50))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Computer()));
              },
              child: Text(
                'Paly VS Computer',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "second"),
              ),
              style:
                  ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(290, 50))),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Magic Ball 8'),
          backgroundColor: Colors.blue,
        ),
        body: BallPage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPage_State();
}

class _BallPage_State extends State<BallPage> {
  int ball = 1;

  randomize() {
    setState(() {
      ball = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    randomize();
                    // if (leftdice == 0) {
                    //   leftdice = 1;
                    // }
                    print('jii');
                  },
                  child: Image.asset('images/ball$ball.png')),
            ),
          ),
        ],
      ),
    );
  }
}

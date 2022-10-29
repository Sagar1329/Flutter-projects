import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Piano());
}

class Piano extends StatelessWidget {
  const Piano({Key? key}) : super(key: key);
  Expanded buildkey({Color color = Colors.red, String soundnumber = "7.m4a"}) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            final assetsAudioPlayer = AssetsAudioPlayer();

            assetsAudioPlayer.open(
              Audio("assets/note$soundnumber"),
            );
          },
          child: Text(""),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("Piano"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildkey(color: Colors.red, soundnumber: "1.m4a"),
            buildkey(color: Colors.orange, soundnumber: "2.mp3"),
            buildkey(color: Colors.yellow, soundnumber: "3.mp3"),
            buildkey(color: Colors.green, soundnumber: "4.m4a"),
            buildkey(color: Colors.blue.shade300, soundnumber: "5.m4a"),
            buildkey(color: Colors.indigo, soundnumber: "6.m4a"),
            buildkey(color: Colors.white, soundnumber: "7.m4a"),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

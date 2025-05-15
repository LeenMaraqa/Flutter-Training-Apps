import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone ',
      home: Scaffold(
        appBar: AppBar(title: Text('Xylophone')),
        body: Column(
          children: [
            Tile(color: Colors.red, noteSound: 'note1.wav'),
            Tile(color: Colors.orange, noteSound: 'note2.wav'),
            Tile(color: Colors.yellow, noteSound: 'note3.wav'),
            Tile(color: Colors.green, noteSound: 'note4.wav'),
            Tile(color: Colors.blue, noteSound: 'note5.wav'),
            Tile(color: Colors.purpleAccent, noteSound: 'note6.wav'),
            Tile(color: Colors.pinkAccent, noteSound: 'note7.wav'),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key, required this.color, required this.noteSound});
  final Color color;
  final String noteSound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await player.setAsset('assets/assets/audio/$noteSound');
          player.play();
        },
        child: Container(
          color: color,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.circle, size: 35, color: Colors.white),
              const Icon(Icons.circle, size: 35, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

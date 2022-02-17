import 'package:flutter/material.dart';
import 'package:flutter_twitch_player/flutter_twitch_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitch Player Example',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Twitch Player Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TwitchController twitchController = TwitchController();
  @override
  Widget build(BuildContext context) {
    twitchController.onEnterFullscreen(() => print("Entered fullscreen"));
    twitchController.onExitFullscreen(() => print("Exited fullscreen"));
    twitchController.onStateChanged((state) => print(state));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TwitchPlayerIFrame(
              controller: twitchController,
              channel: "Crown",
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}

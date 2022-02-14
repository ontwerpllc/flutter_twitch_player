import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TwitchPlayer extends StatefulWidget {
  const TwitchPlayer({
    Key? key,
    required this.channel,
    this.parent = "twitch.tv",
    this.volume = 1.0,
    this.muted = false,
    this.borderRadius,
  }) : super(key: key);

  final String channel;
  final String parent;
  final double volume;
  final bool muted;
  final BorderRadius? borderRadius;

  @override
  State<TwitchPlayer> createState() => _TwitchPlayerState();
}

class _TwitchPlayerState extends State<TwitchPlayer> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: GestureDetector(
          child: InAppWebView(
          ),
        ),
      ),
    );
  }
}

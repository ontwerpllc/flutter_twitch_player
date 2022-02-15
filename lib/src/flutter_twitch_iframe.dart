import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'flutter_twitch_controller.dart';

class TwitchPlayerIFrame extends StatefulWidget {
  /// Inline Twitch Video Player
  const TwitchPlayerIFrame({
    Key? key,
    required this.channel,
    required this.controller,
    this.parent = "twitch.tv",
    this.volume = 1.0,
    this.muted = false,
    this.borderRadius,
  }) : super(key: key);

  /// Twitch channel name
  final String channel;

  /// Controller
  final TwitchController controller;

  /// Twitch parent, usually twitch.tv
  final String parent;

  /// Starting volume
  final double volume;

  /// Start muted?
  final bool muted;

  /// Border radius if desired
  final BorderRadius? borderRadius;

  @override
  State<TwitchPlayerIFrame> createState() => _TwitchPlayerIFrameState();
}

class _TwitchPlayerIFrameState extends State<TwitchPlayerIFrame> {
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri(
              scheme: 'https',
              host: 'player.twitch.tv',
              queryParameters: {
                "channel": widget.channel,
                "parent": widget.parent,
              },
            ),
          ),
          onEnterFullscreen: (_) => widget.controller.enterFullscreen(),
          onExitFullscreen: (_) => widget.controller.exitFullscreen(),
          onLoadStart: (controller, __) => {
            inAppWebViewController = controller,
            widget.controller.updateState(TwitchState.loading),
          },
          onLoadStop: (_, __) => {
            widget.controller.updateState(TwitchState.done),
          },
          onLoadError: (_, __, ___, ____) =>
              widget.controller.updateState(TwitchState.error),
        ),
      ),
    );
  }
}

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
    this.autoplay = true,
    this.borderRadius,
  }) : super(key: key);

  /// Twitch channel name
  final String channel;

  /// Controller
  final TwitchController controller;

  /// Twitch parent, usually twitch.tv
  final String parent;

  /// Autoplay the video
  final bool autoplay;

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
            inAppWebViewController.addUserScript(
              userScript: UserScript(source: """
                async function wait() {
                  while(!document.getElementsByClassName('ScLoadingSpinnerCircle-sc-qd487d-1')[0]) {
                    await new Promise(r => setTimeout(r, 500));
                  }
                  while(document.getElementsByClassName('ScLoadingSpinnerCircle-sc-qd487d-1')[0]) {
                    await new Promise(r => setTimeout(r, 500));
                  }
                  ${widget.autoplay ? """""" : """document.querySelector('[data-a-target="player-play-pause-button"]').click();"""}
                }
                wait();
              """, injectionTime: UserScriptInjectionTime.AT_DOCUMENT_END),
            ),
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

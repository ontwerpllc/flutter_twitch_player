class TwitchController {
  /// Twitch Video Player Controller
  bool isFullscreen = false;
  String twitchState = TwitchState.loading;
  Function? _onEnterFullscreenFunction;
  Function? _onExitFullscreenFunction;
  late void Function(String) _onStateChanged;

  void onEnterFullscreen(Function function) {
    _onEnterFullscreenFunction = function;
  }

  void onExitFullscreen(Function function) {
    _onExitFullscreenFunction = function;
  }

  void onStateChanged(void Function(String state) function) {
    _onStateChanged = function;
  }

  void enterFullscreen() async {
    isFullscreen = true;
    if (_onEnterFullscreenFunction != null) {
      _onEnterFullscreenFunction?.call();
    }
  }

  void exitFullscreen() async {
    isFullscreen = false;
    if (_onExitFullscreenFunction != null) {
      _onExitFullscreenFunction?.call();
    }
  }

  void updateState(String state) {
    twitchState = state;
    _onStateChanged.call(state);
  }
}

class TwitchState {
  static const loading = "LOADING";
  static const done = "DONE";
  static const error = "ERROR";
}

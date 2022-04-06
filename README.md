# Flutter Twitch Player

![](https://variety.com/wp-content/uploads/2015/03/twitch-logo.jpg?w=636)

A flutter plugin that plays twitch live streams using [InAppWebview](https://pub.dev/packages/flutter_inappwebview) under the hood.

## Getting started

Update gradle in `android/build.gradle`

```gradle
dependencies {
classpath 'com.android.tools.build:gradle:7.0.0'
}
```

Update minSDK to 17 in `android/app/build.gradle`

```gradle
defaultConfig {
    minSdkVersion 17
}
```

Update distributionUrl in `android/gradle/gradle-wrapper.properties`

```gradle
distributionUrl=https\://services.gradle.org/distributions/gradle-7.0.2-all.zip
```

## Usage

```dart
TwitchPlayerIFrame(channel: "channel name", controller: TwitchController())
```

## TODO

- play
- pause
- mute
- unmute
- fullscreen

## Additional information

Only tested on android.

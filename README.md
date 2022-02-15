# Flutter Twitch Player

A flutter plugin that plays twitch live streams using InAppWebview under the hood.

## Features

Plays twitch streams inline

## Getting started

Update gradle in `android/build.gradle`

```gradle
dependencies {
classpath 'com.android.tools.build:gradle:7.0.0'
...
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
TwitchPlayerIFrame(channel: "channel name")
```

## TODO

-Add more functionality [play, pause, fullscreen, mute]

## Additional information

Only tested on android. iOS still being worked on.
TwitchPlayer doesn't work yet only the Iframe version.

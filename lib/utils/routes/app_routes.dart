import 'package:flutter/material.dart';
import 'package:media_player/screen/dash/dash_screen.dart';
import 'package:media_player/screen/music/view/music_player_screen.dart';
import 'package:media_player/screen/splash/splash_screen.dart';
import 'package:media_player/screen/video/view/video_player_screen.dart';

Map <String, WidgetBuilder> app_route={
  "/":(context) => SplashScreen(),
  "home":(context) => DashScreen(),
  "music":(context) => MusicPlayerScreen(),
  "video":(context) => VideoPlayerScreen(),
};
import 'package:flutter/material.dart';
import 'package:media_player/screen/music/provider/music_provider.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:media_player/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MusicProvider()),
        ChangeNotifierProvider.value(value: VideoProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
      routes: app_route,
      ),
    )
  );
}
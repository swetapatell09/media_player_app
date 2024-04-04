import 'package:flutter/material.dart';
import 'package:media_player/screen/video/view/video_screen.dart';

import '../music/view/music_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              title: const Text("My Music"),
              backgroundColor: Colors.cyanAccent,
              bottom: const TabBar(
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Music",
                  ),
                  Tab(
                    text: "Video",
                  ),
                ],
              )),
          body: const TabBarView(
            children: [
              MusicScreen(),
              VideoScreen(),
            ],
          )),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VideoProvider>().initVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Video"), backgroundColor: Colors.blue),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 200,
              child: Chewie(controller: providerW!.chewieController!)),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Name: ${providerW!.videoModelList[providerW!.videoIndex].name}",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text(
                    "Description: ${providerW!.videoModelList[providerW!.videoIndex].description}",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

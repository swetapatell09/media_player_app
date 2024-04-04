import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_player/screen/video/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  List<VideoModel> videoModelList = [
    VideoModel(
        image: "assets/image/jamal.jpg",
        name: "jamal kudu",
        link: "assets/video/1.mp4",
        description:
            "The song 'Jamal Jamaloo Kudu' has enthralled the audience with its amazing chorus and music. The music is daring and gets the blood of the audience pumping with its bold beats."),
    VideoModel(
        image: "assets/image/apnabanale.jpg",
        name: "Apna Bana Le",
        link: "assets/video/2.mp4",
        description:
            "Apna Bana Le Lyrics from Bhediya is brand new Hindi song sung by Arijit Singh and this latest song is featuring Varun Dhawan, Kriti Sanon. Apna Bana Le song lyrics are penned by Amitabh Bhattacharya while its music is also given by Sachin-Jigar and video has been directed by Amar Kaushik."),
    VideoModel(
        image: "assets/image/kalachasma.jpg",
        name: "Kala Chasma",
        link: "assets/video/3.mp4",
        description:
            "The world has caught up real fast on the 'Kala Chashma trend' as the song has come back into the limelight after several years. Many might have listened to it in the 2016 film Baar Baar Dekho."),
    VideoModel(
        image: "assets/image/kesariya.jpg",
        name: "Kesariya",
        link: "assets/video/4.mp4",
        description:
            " Kesariya is a song by Indian singer-composer Pritam, featuring singer Arijit Singh. Written by Amitabh Bhattacharya and produced by Pritam, it was released as a single on July 17, 2022"),
    VideoModel(
        image: "assets/image/ashiqui.jpg",
        name: "Meri aashiqui",
        link: "assets/video/5.mp4",
        description:
            "Gulshan Kumar & T-Series present Bhushan Kumar's latest music video Meri Aashiqui . This new song features Jubin Nautiyal Ihana Dhillon & Altamash Faraz and sung byJubin Nautiyal. The music for this romantic song is composed by Rochak Kohli and penned by Rashmi Virag. The video is directed by Ashish Panda."),
  ];
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int videoIndex = 0;

  void initVideoPlayer() {
    videoPlayerController =
        VideoPlayerController.asset("${videoModelList[videoIndex].link}")
          ..initialize().then((value) {
            notifyListeners();
            chewieController =
                ChewieController(videoPlayerController: videoPlayerController!);
          });
  }

  void changeIndexV(int i) {
    videoIndex = i;
    initVideoPlayer();
    notifyListeners();
  }
}

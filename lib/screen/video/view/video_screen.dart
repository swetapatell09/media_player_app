import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: false,
            initialPage: 0,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              providerR!.changeIndexV(index);
            },
          ),
          itemCount: providerR!.videoModelList.length,
          itemBuilder: (context, index, realIndex) => InkWell(onTap: (){
            providerR!.changeIndexV(index);
            Navigator.pushNamed(context, 'video');
          },

            child: Image.asset(
                "${providerW!.videoModelList[index].image}",
                fit: BoxFit.cover,
                height: 200,
                width: 200),
          ),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(providerR!.videoModelList.length, (index) => Container(
            height: 10,width: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: index==providerR!.videoIndex?Colors.blue:Colors.grey),
            margin: EdgeInsets.all(2),
          )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.videoModelList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                providerR!.changeIndexV(index);
                Navigator.pushNamed(context, 'video');
              },
              child: Container(
                height: 65,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset("${providerW!.videoModelList[index].image}",
                        height: 200, fit: BoxFit.cover),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${providerW!.videoModelList[index].name}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );;
  }
}


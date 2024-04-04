import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/music/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
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
              providerR!.changeIndex(index);
            },
          ),
          itemCount: providerR!.musicModelList.length,
          itemBuilder: (context, index, realIndex) => InkWell(onTap: (){
            providerR!.changeIndex(index);
            Navigator.pushNamed(context, 'music');
          },

            child: Image.asset(
                "${providerW!.musicModelList[index].image}",
                fit: BoxFit.cover,
                height: 200,
                width: 200),
          ),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(providerR!.musicModelList.length, (index) => Container(
            height: 10,width: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: index==providerR!.index?Colors.blue:Colors.grey),
            margin: EdgeInsets.all(2),
          )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.musicModelList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                providerR!.changeIndex(index);
                Navigator.pushNamed(context, 'music');
              },
              child: Container(
                height: 65,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset("${providerW!.musicModelList[index].image}",
                        height: 200, fit: BoxFit.cover),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${providerW!.musicModelList[index].name}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

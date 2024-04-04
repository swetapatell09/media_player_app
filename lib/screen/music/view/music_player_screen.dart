import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/music/provider/music_provider.dart';
import 'package:provider/provider.dart';

import '../model/music_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<MusicProvider>().initMusic();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text("${providerW!.musicModelList[providerW!.index].name}"),
          backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Container(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      "${providerW!.musicModelList[providerW!.index].image}",
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            PlayerBuilder.currentPosition(
              player: providerW!.assetsAudioPlayer,
              builder: (context, position) {
                return Column(
                  children: [
                    Theme(
                      data: ThemeData(useMaterial3: false),
                      child: Slider(
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) {
                          providerR!.assetsAudioPlayer
                              .seek(Duration(seconds: value.toInt()));
                        },
                        max: providerR!.totalDuration.inSeconds.toDouble(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$position",
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 18)),
                          Text("${providerR!.totalDuration}",
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 18))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                            angle: (pi * 2) / 2,
                            child: IconButton(
                              onPressed: () {
                                providerR!.assetsAudioPlayer.previous();
                                providerR!.previousOrNext(providerR!.index-1);
                              },
                              icon: const Icon(Icons.double_arrow),
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              if(providerW!.isPlay)
                                {
                                  providerR!.assetsAudioPlayer.pause();
                                  providerR!.changeButton(false);

                                }
                              else
                                {
                                  providerR!.assetsAudioPlayer.play();
                                  providerR!.changeButton(true);
                                }

                            },
                            icon: Icon(providerR!.isPlay
                                ? Icons.pause
                                : Icons.play_arrow),
                            color: Colors.white),
                        IconButton(
                            onPressed: () {
                              providerR!.assetsAudioPlayer.next();
                              providerR!.previousOrNext(providerR!.index+1);

                            },
                            icon: const Icon(Icons.double_arrow),
                            color: Colors.white),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../model/music_model.dart';

class MusicProvider with ChangeNotifier {
  Duration totalDuration = Duration(seconds: 0);
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  int index=0;

  void changeIndex(int i)
  {
    index =i;
    notifyListeners();
  }


  Future<void> initMusic() async {
    await assetsAudioPlayer.open(
      Playlist(
        audios: musicModelList.map((e) => Audio.network(e.link!)).toList(),
        startIndex: index
      ),
      autoStart: false,
      showNotification: true,
    );
    totalDuration = assetsAudioPlayer.current.value!.audio.duration;
    notifyListeners();
  }

  bool isPlay = true;

  void changeButton(bool play)
  {
    isPlay = play;
    notifyListeners();
  }

  List<MusicModel> musicModelList =[

    MusicModel(name: "Pehle Bhi Main",link: "https://pagalfree.com/musics/128-Pehle Bhi Main - Animal 128 Kbps.mp3",image: "assets/image/animal.jpg"),
    MusicModel(name: "Apna Bana Le",link: "https://pagalfree.com/musics/128-Apna Bana Le - Bhediya 128 Kbps.mp3",image:"assets/image/bhediya.jpg" ),
    MusicModel(name:"Tum Hi Ho" ,link:"https://pagalfree.com/musics/128-Tum Hi Ho - Aashiqui 2 128 Kbps.mp3" ,image:"assets/image/img.png"),
    MusicModel(name:"Heeriye" ,link: "https://pagalfree.com/musics/128-Heeriye - Race 3 128 Kbps.mp3",image:"assets/image/heeriye.jpg" ),
    MusicModel(name: "Humdard",link: "https://pagalfree.com/musics/128-Humdard - Ek Villain 128 Kbps.mp3",image:"assets/image/img_1.png"),
    MusicModel(name: "Khairiyat",link:"https://pagalfree.com/musics/128-Khairiyat - Chhichhore 128 Kbps.mp3" ,image: "assets/image/khairiyat.jpg"),
    MusicModel(name: "O Maahi",link:"https://pagalfree.com/musics/128-O Maahi - Dunki 128 Kbps.mp3" ,image:"assets/image/maahi.jpg" ),

  ];
  void previousOrNext(int r)
  {
    if(r<0)
      {
        index=musicModelList.length-1;
      }
    else if(r>musicModelList.length-1)
      {
        index=0;
      }
    else
      {
        index=r;
      }
    notifyListeners();
  }
}

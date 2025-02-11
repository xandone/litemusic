import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../model/music_model.dart';



/// @author: xiao
/// created on: 2025/1/20 15:36
/// description:

class MusicService extends GetxService {
  static MusicService get instance => Get.find<MusicService>();

  Rx<MusicModel?> music = Rx(null);

  RxBool isPlaying = false.obs;

  final AudioPlayer audioPlayer = AudioPlayer();

  void upDateMusic(MusicModel model) {
    music.value = model;
  }

  void setMusicUrl(url) async {
    isPlaying.value = true;
    await audioPlayer.setUrl(url);
    audioPlayer.play();
  }
}

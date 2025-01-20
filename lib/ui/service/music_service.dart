import 'package:get/get.dart';

import '../model/music_model.dart';

/// @author: xiao
/// created on: 2025/1/20 15:36
/// description:

class MusicService extends GetxService {
  static MusicService get instance => Get.find<MusicService>();

  Rx<MusicModel?> music = Rx(null);

  void upDateMusic(MusicModel model) {
    music.value = model;
  }
}

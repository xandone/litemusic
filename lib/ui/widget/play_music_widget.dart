import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../service/music_service.dart';
import 'image_loader.dart';

/// @author: xiao
/// created on: 2025/1/20 15:33
/// description:

class PlayMusicWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayMusicWidgetState();
  }
}

class _PlayMusicWidgetState extends State<PlayMusicWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
          color: Colors.blue,
          child: Row(
            children: [
              ImageLoader.display(
                  MusicService.instance.music.value?.pic ?? '', 45, 45),
              Text(
                MusicService.instance.music.value?.title ?? '',
                style:
                    const TextStyle(fontSize: 14, color: CupertinoColors.white),
              )
            ],
          ),
        ));
  }
}

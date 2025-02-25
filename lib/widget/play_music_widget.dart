import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:litemusic/routes/page_path.dart';

import '../../res/gaps.dart';
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
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () {
            Get.toNamed(PagePath.mMusicDetails);
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
            color: Colors.blue,
            child: Row(
              children: [
                ImageLoader.display(
                    MusicService.instance.music.value?.pic ?? '', 45, 45),
                Gaps.hGaps10,
                Expanded(
                    child: Text(
                  MusicService.instance.music.value?.title ?? '',
                  style: const TextStyle(
                      fontSize: 14, color: CupertinoColors.white),
                )),
                GestureDetector(
                  onTap: () {
                    MusicService.instance.isPlaying.value =
                        !MusicService.instance.isPlaying.value;
                    if (MusicService.instance.isPlaying.value) {
                      MusicService.instance.audioPlayer.pause();
                    } else {
                      MusicService.instance.audioPlayer.play();
                    }
                  },
                  child: MusicService.instance.isPlaying.value
                      ? SvgPicture.asset('assets/pause.svg',
                          width: 40, height: 40)
                      : SvgPicture.asset('assets/play.svg',
                          width: 40, height: 40),
                )
              ],
            ),
          ),
        ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:litemusic/res/colors.dart';
import 'package:litemusic/res/gaps.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';

import '../../service/music_service.dart';
import '../../widget/image_loader.dart';

/// @author: xiao
/// created on: 2025/2/11 15:05
/// description:

class MusicDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MusicDetailsState();
  }
}

class _MusicDetailsState extends State<MusicDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appBgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGaps50,
              LoopAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 2 * pi),
                duration: const Duration(seconds: 8),
                builder: (context, value, _) {
                  return Transform.rotate(
                    angle: value, // use value
                    child: ClipOval(
                      child: ImageLoader.display(
                          MusicService.instance.music.value?.pic ?? '',
                          250,
                          250),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

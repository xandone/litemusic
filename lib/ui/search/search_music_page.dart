import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:litemusic/res/colors.dart';
import 'package:litemusic/ui/service/music_service.dart';
import '../../utils/toast.dart';
import '../widget/play_music_widget.dart';
import 'controller/SearchMusicController.dart';

/// @author: xandone
/// created on: 2025/1/17 11:02
/// description:

class SearchMusicPage extends GetView<Searchmusiccontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.appBgColor,
        appBar: AppBar(
          backgroundColor: MyColors.white,
          title: TextField(
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                controller.search();
              } else {
                MyToast.showToast('请输入关键字');
              }
            },
            controller: controller.keywordController,
            autofocus: false,
            textInputAction: TextInputAction.search,
            style: const TextStyle(fontSize: 15, color: MyColors.textColor1),
            decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.zero,
                isDense: true,
                border: InputBorder.none,
                hintStyle: TextStyle(color: MyColors.hintColor, fontSize: 14),
                hintText: '请输入关键字'),
          ),
        ),
        body: Column(
          children: [
            PlayMusicWidget(),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: controller.datas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        contentPadding:
                            const EdgeInsets.only(left: 16, right: 16),
                        title: Text(
                          controller.datas[index].title ?? '-',
                          style: const TextStyle(
                              color: MyColors.textColor1, fontSize: 15),
                        ),
                        subtitle: Text(
                          controller.datas[index].author ?? '',
                          style: const TextStyle(
                              color: MyColors.textColor2, fontSize: 12),
                        ),
                        onTap: () async {
                          MusicService.instance
                              .upDateMusic(controller.datas[index]);
                          await audioPlayer
                              .setUrl(controller.datas[index].url ?? '');
                          audioPlayer.play();
                        },
                      );
                    })))
          ],
        ));
  }
}

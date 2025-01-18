import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litemusic/res/colors.dart';
import 'controller/SearchMusicController.dart';

/// @author: xandone
/// created on: 2025/1/17 11:02
/// description:

class SearchMusicPage extends GetView<Searchmusiccontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.appBgColor,
        body: Column(
          children: [
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
                      );
                    })))
          ],
        ));
  }
}

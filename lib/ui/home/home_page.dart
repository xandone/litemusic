import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:litemusic/res/colors.dart';
import 'package:litemusic/ui/routes/page_path.dart';
import 'package:litemusic/utils/toast.dart';

/// @author: xiao
/// created on: 2025/1/17 10:01
/// description:

class HomePage extends GetView {
  static const list = ['历史', '收藏', '下载'];
  static const icons = [Icons.history, Icons.collections, Icons.download];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appBgColor,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: GestureDetector(
          onTap: () => Get.toNamed(PagePath.mHomeSearch),
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: MyColors.divideLineColor, width: 1)),
            child: const Text(
              '搜索音乐',
              style: TextStyle(fontSize: 15, color: MyColors.hintColor),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
              child: GridView.builder(
            padding: const EdgeInsets.only(left: 16, right: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    MyToast.showToast(list[index]);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        list[index],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}

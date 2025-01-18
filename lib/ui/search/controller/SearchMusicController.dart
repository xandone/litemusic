import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:litemusic/http/http_dio.dart';
import 'package:litemusic/ui/model/music_model.dart';

import '../../../utils/logger.dart';
import '../../../utils/my_dialog.dart';
import '../../../utils/toast.dart';

/// @author: xiao
/// created on: 2025/1/17 11:05
/// description:

class Searchmusiccontroller extends GetxController {
  final TextEditingController keywordController = TextEditingController();
  RxList<MusicModel> datas = RxList();

  @override
  void onInit() {
    super.onInit();
    // search();
  }

  void search({isShowLoading = true}) async {
    if (isShowLoading) {
      MyDialog.showLoading();
    }
    try {
      var params = {
        'input': keywordController.text,
        'type': 'netease',
        'filter': 'name',
        'page': 1,
      };

      var header = {'X-Requested-With': 'XMLHttpRequest'};
      var result =
          await HttpDio.instance.post('', data: params, header: header);
      if (result['code'] == ApiCode.SUCCESS) {
        for (var it in result['data']) {
          datas.add(MusicModel.fromJson(it));
        }
      }
    } catch (e) {
      Log.d(e.toString());
      MyToast.showToast(e.toString());
    } finally {
      if (isShowLoading) {
        MyDialog.dismiss();
      }
    }
  }
}

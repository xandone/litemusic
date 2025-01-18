import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:litemusic/ui/home/home_page.dart';
import 'package:litemusic/ui/routes/page_path.dart';
import 'package:litemusic/ui/search/controller/SearchMusicController.dart';
import 'package:litemusic/ui/search/search_music_page.dart';

/// @author: xandone
/// created on: 2025/1/17 11:14
/// description:

class PageManifest {
  PageManifest._();

  static final routes = [
    GetPage(
      name: PagePath.mMain,
      page: () {
        return HomePage();
      },
      bindings: [],
    ),
    GetPage(
      name: PagePath.mHomeSearch,
      page: () {
        return SearchMusicPage();
      },
      bindings: [BindingsBuilder.put(() => Searchmusiccontroller())],
    ),
  ];
}

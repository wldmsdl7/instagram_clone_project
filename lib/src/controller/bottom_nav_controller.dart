import 'package:get/get.dart';
import 'package:instagram_clone/src/pages/upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  //bottom에 있는 페이지 인덱스 관리
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    pageIndex(value);
    var page = PageName.values[value];

    switch (page) {
      case PageName.HOME:
        _changePage(value);
        break;
      case PageName.SEARCH:
        _changePage(value);
        break;
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.ACTIVITY:
        _changePage(value);
        break;
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}

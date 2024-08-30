//app이 실행되는 동시에 getX Controller들을 필요에 따라 instance를 올려주기 위함
import 'package:get/get.dart';
import 'package:instagram_clone/src/controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(),
        permanent: true); //parmanent: true -> 앱이 종료되기 전까지 instance가 살아있게 해줌
  }
}

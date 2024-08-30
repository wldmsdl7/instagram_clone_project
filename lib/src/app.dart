import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/src/components/image.dart';
import 'package:instagram_clone/src/controller/bottom_nav_controller.dart';

//currentIndex를 pageIndex로 설정하기 위해 , pageIndex에 접근 //true 이면 뒤로가기 버튼을 눌렀을 때 앱 종료
class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Obx(() => PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(),
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                Container(
                  child: Center(child: Text('HOME')),
                ),
                Container(
                  child: Center(child: Text('SEARCH')),
                ),
                Container(
                  child: Center(child: Text('UPLOAD')),
                ),
                Container(
                  child: Center(child: Text('ACTIVITY')),
                ),
                Container(
                  child: Center(child: Text('MYPAGE')),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              elevation: 0,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  label: 'home',
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/src/components/image.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _searchFocusState();
}

@override
class _searchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  _tabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      child: Container(
        //scorll햇을때 고정되어있는 부분
        height: AppBar().preferredSize.height, //appbar 사이즈랑 똑같게
        width: Size.infinite.width,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne('추천'),
              _tabMenuOne('계정'),
              _tabMenuOne('오디오'),
              _tabMenuOne('태그'),
              _tabMenuOne('장소'),
              _tabMenuOne('릴스'),
            ]),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  _body() {
    return Container(
      child: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text('추천 페이지')),
          Center(child: Text('계정 페이지')),
          Center(child: Text('오디오 페이지')),
          Center(child: Text('태그 페이지')),
          Center(child: Text('장소 페이지')),
          Center(child: Text('릴스 페이지'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '검색',
                contentPadding: EdgeInsets.all(15),
                isDense: true // padding
                ),
          ),
        ),
        bottom: _tabMenu(),
      ),
      //appbar 상단에 고정되니까 따로 빼서 작성
      body: _body(),
    );
  }
}

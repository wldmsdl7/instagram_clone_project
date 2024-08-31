import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

import 'search_focus.dart';

class Search extends StatefulWidget {
  //이미지 개수에 따라 상태가 달라짐
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0]; //균등하게 box가 들어가있지 않아 개수를 체크해주는 것이 좋을듯!

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (i >= 90 && gi == groupIndex.indexOf(max<int>(groupIndex)!)) {
        break;
      } // gridview 끝 맞추기
      if (gi != 1) size = Random().nextInt(100) % 2 == 0 ? 1 : 2;

      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              //Get.to(SearchFocus()); -> bottomnavigationbar 유지 Xx
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex], //3등분된 길이
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://file3.instiz.net/data/cached_img/upload/2022/02/08/14/1b7ffb2353d9f1d8163fa86a4a65b40b.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      //상단 : 상태표시줄 하부, 하단: 쓸어올리는 부분의 상부에 화면 띄우도록 함
      child: Column(
        children: [
          _appBar(),
          Expanded(
            child: _body(),
          ), //Column안에 AppBar 구현하는 이유 : Scroll 했을 때 AppBar도 scroll됨
        ],
      ),
    ));
  }
}

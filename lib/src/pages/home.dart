import 'package:flutter/material.dart';
import 'package:instagram_clone/src/components/avatar_widget.dart';
import 'package:instagram_clone/src/components/image.dart';
import 'package:instagram_clone/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              'https://us.123rf.com/450wm/malven/malven1703/malven170300191/74796849-%EC%96%B4%EB%91%90%EC%9A%B4-%EC%B2%AD%EB%A1%9D%EC%83%89-%EC%83%89%EC%83%81%EC%9D%98-%EC%A7%81%EB%AC%BC-%EB%98%90%EB%8A%94-%EB%AA%A9%ED%99%94-%EC%86%8C%EC%9E%AC%EC%9D%98-%EC%A7%88%EA%B0%90-%EB%B0%8F-%EB%B0%B0%EA%B2%BD.jpg',
          size: 70,
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        SizedBox(width: 5),
        ...List.generate(
          //...:List배열을 나열하겠다
          100,
          (index) => AvatarWidget(
            type: AvatarType.TYPE1,
            thumbPath:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8uOkWxgpvqLQ7A6617sMMTfrycCU0lRxNDQ&s.jpg',
          ),
        ),
      ]),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 200,
          leading: ImageData(
            IconsPath.logo,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(
                  IconsPath.directMessage,
                  width: 40,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            _storyBoardList(),
            _postList(),
          ],
        ));
  }
}

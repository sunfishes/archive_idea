import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // 입체감이 사라짐
        title: Text(
          'Archive Idea',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return listItem(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // 새 아이디어 작성화면으로 이동

      },
      child: Image.asset('assets/idea.png', width: 48, height: 48,
      ),
        backgroundColor: Color(0xff7f52fd).withOpacity(0.7),
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      height: 82,
      margin: EdgeInsets.only(top: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffd9d9d9), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          //아이디어 제목
          Container(
            margin: EdgeInsets.only(left: 16, bottom: 16),
            child: Text('# 공공데이터 활용 공모전 아이디어', style: TextStyle(fontSize: 16)),
          ),
          //일시
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 16, bottom: 8),
              child: Text(
                '2025.05.17 23:22',
                style: TextStyle(color: Color(0xffaeaeae), fontSize: 10),
              ),
            ),
          ),
          //아이디어 중요도 점수(별 형태)
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 16, bottom: 8),
              child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 16,
              itemPadding: EdgeInsets.symmetric(horizontal: 0),
              itemBuilder: (context, index) {
                return Icon(Icons.star, color: Colors.amber,);
              },
              ignoreGestures: true,
              updateOnDrag: false,
              onRatingUpdate: (value) {

              },),
            ),)
        ],
      ),
    );
  }
}

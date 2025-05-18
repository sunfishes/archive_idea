import 'package:archive_idea/data/idea_info.dart';
import 'package:archive_idea/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var dbHelper = DatabaseHelper(); //데이터베이스 접근을 용이하게 해주는 유틸 객체
  List<IdeaInfo> lstIdeaInfo = []; //아이디어 목록들

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //아이디어 목록들 가져오기
    getIdeaInfo();

    //임시
    //setInserIdeaInfo();
  }

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
          itemCount: lstIdeaInfo.length,
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
            child: Text(lstIdeaInfo[index].title, style: TextStyle(fontSize: 16)),
          ),
          //일시
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 16, bottom: 8),
              child: Text(DateFormat("yyyy.MM.dd HH:mm").format(DateTime.fromMillisecondsSinceEpoch(lstIdeaInfo[index].createdAt)),
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
              initialRating: lstIdeaInfo[index].priority.toDouble(),
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

  Future<void> getIdeaInfo() async {
    //아이디어 목록 조회 (select)
    await dbHelper.initDatabase();
    //idea  정보들을 가지고와서 멤버(전역)변수 리스트객체에 담기
    lstIdeaInfo = await dbHelper.getAllIdeaInfo();
    //리스트 객체 역순으로 정렬
    lstIdeaInfo.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    setState(() {});
  }

  Future<void> setInserIdeaInfo() async {
    //삽입 메서드
    await dbHelper.initDatabase();
    await dbHelper.insertIdeaInfo(IdeaInfo(title: '# 공모전 아이디어', motive: '# 링커리어에서 찾게됨', content: '# 자세한 내용 입니다..', priority: 5, feedback: '# 피드백 사항입니다.', createdAt: DateTime.now().millisecondsSinceEpoch,));
  }
}

import 'package:archive_idea/data/idea_info.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  IdeaInfo? ideaInfo;
  EditScreen({super.key, this.ideaInfo });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  //아이디어 제목
final TextEditingController _titleController = TextEditingController();
//아이디어 계기
final TextEditingController _motiveController = TextEditingController();
//아이디어 내용
final TextEditingController _contentController = TextEditingController();
//피드백 사항
final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(child: Icon(
          Icons.arrow_back_ios_new,
          size: 24,
          color: Colors.black,
        ),
          onTap: () {
            //back button
            //pop을 하면 이전으로 돌아간다.
            Navigator.pop(context);
          },
        ),
        title: Text('새 아이디어 작성하기', style: TextStyle(color: Colors.black, fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('제목'),
            Container(
              margin: EdgeInsets.only(top: 8),

              height: 41,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffd9d9d9),
                    ),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  hintText: '아이디어 제목',
                  hintStyle: TextStyle(color: Color(0xffb4b4b4),)
                ),
                style: TextStyle(fontSize: 12, color: Colors.black),
                controller: _titleController,
              ),
            ),
            SizedBox(height: 16,),
            Text('아이디어를 작성한 계기'),
            Container(
              margin: EdgeInsets.only(top: 8),

              height: 41,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffd9d9d9),
                      ),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    hintText: '아이디어를 떠올린 계기',
                    hintStyle: TextStyle(color: Color(0xffb4b4b4),)
                ),
                style: TextStyle(fontSize: 12, color: Colors.black),
                controller: _motiveController,
              ),
            ),
            SizedBox(height: 16,),
            Text('아이디어 내용'),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: TextField(
                maxLength: 500,
                maxLines: 5,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffd9d9d9),
                      ),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    hintText: '떠오르신 아이디어를 자세하게 작성해주세요',
                    hintStyle: TextStyle(color: Color(0xffb4b4b4),)
                ),
                style: TextStyle(fontSize: 12, color: Colors.black),
                controller: _contentController,
              ),
            ),
            SizedBox(height: 16,),
            Text('아이디어 중요도 점수'),

            SizedBox(height: 16,),
            Text('유저 피드백 사항(선택)'),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: TextField(
                maxLength: 500,
                maxLines: 5,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffd9d9d9),
                      ),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    hintText: '떠오르신 아이디어 기반으로\n전달받은 피드백들을 정리해주세요',
                    hintStyle: TextStyle(color: Color(0xffb4b4b4),)
                ),
                style: TextStyle(fontSize: 12, color: Colors.black),
                controller: _feedbackController,
              ),
            ),
            SizedBox(height: 16,),
                ],
                ),
        ),
      ),
    );
  }
}

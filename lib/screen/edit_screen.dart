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
            TextField(
              style: TextStyle(fontSize: 12, color: Colors.black),
              controller: _titleController,
            ),
            Text('아이디어를 작성한 계기'),

            Text('아이디어 내용'),

            Text('아이디어 중요도 점수'),

            Text('유저 피드백 사항(선택)'),

                ],
                ),
        ),
      ),
    );
  }
}

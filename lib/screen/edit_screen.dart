import 'package:archive_idea/data/idea_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

//아이디어중요도점수 container 클릭 상태 관리 변수
  bool isClickPoint1 = false;
  bool isClickPoint2 = false;
  bool isClickPoint3 = true;
  bool isClickPoint4 = false;
  bool isClickPoint5 = false;

//아이디어 선택된 현재 중요도 점수
  int priorityPoint = 3;

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
                textInputAction: TextInputAction.next,//사용자경험강화(다음필드 입력창으로 넘어감)
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
            Text('아이디어를 떠올린 계기'),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 41,
              child: TextField(
                textInputAction: TextInputAction.next,
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
                //내용에는 상세아이디어를 적기때문에 다음으로 넘어가지않도록 한다
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
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,//균등정렬배치
                children: [
                  GestureDetector(child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: isClickPoint1 ? Color(0xffd6d6d6) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: Text('1', style:
                    TextStyle(fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
                    ),
                  ),
                    onTap: () {
                      //클릭기능구현
                      //1. 모든 버튼 값 초기화
                      initClickStatus();
                      //2. 선택된 버튼에 대한 변수 값 및 위젯 update
                      setState(() {
                        priorityPoint = 1;
                        isClickPoint1 = true;
                      });
                    },
                  ),
                  GestureDetector(child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 40,
                    decoration: ShapeDecoration(
                        color: isClickPoint2 ? Color(0xffd6d6d6) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: Text('2', style:
                    TextStyle(fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
                    ),
                  ),
                    onTap: () {
                      //클릭기능구현
                      //1. 모든 버튼 값 초기화
                      initClickStatus();
                      //2. 선택된 버튼에 대한 변수 값 및 위젯 update
                      setState(() {
                        priorityPoint = 2;
                        isClickPoint2 = true;
                      });
                    },
                  ),
                  GestureDetector(child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 40,
                    decoration: ShapeDecoration(
                        color: isClickPoint3 ? Color(0xffd6d6d6) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: Text('3', style:
                    TextStyle(fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
                    ),
                  ),
                    onTap: () {
                      //클릭기능구현
                      //1. 모든 버튼 값 초기화
                      initClickStatus();
                      //2. 선택된 버튼에 대한 변수 값 및 위젯 update
                      setState(() {
                        priorityPoint = 3;
                        isClickPoint3 = true;
                      });
                    },
                  ),
                  GestureDetector(child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 40,
                    decoration: ShapeDecoration(
                        color: isClickPoint4 ? Color(0xffd6d6d6) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: Text('4', style:
                    TextStyle(fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
                    ),
                  ),
                    onTap: () {
                      //클릭기능구현
                      //1. 모든 버튼 값 초기화
                      initClickStatus();
                      //2. 선택된 버튼에 대한 변수 값 및 위젯 update
                      setState(() {
                        priorityPoint = 4;
                        isClickPoint4 = true;
                      });
                    },
                  ),
                  GestureDetector(child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: isClickPoint5 ? Color(0xffd6d6d6) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: Text('5', style:
                    TextStyle(fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
                    ),
                  ),
                    onTap: () {
                      //클릭기능구현
                      //1. 모든 버튼 값 초기화
                      initClickStatus();
                      //2. 선택된 버튼에 대한 변수 값 및 위젯 update
                      setState(() {
                        priorityPoint = 5;
                        isClickPoint5 = true;
                      });
                    },
                  ),
               ],
              ),
            ),
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

  void initClickStatus() {
    //클릭 상태를 초기화 해주는 함수
    isClickPoint1 = false;
    isClickPoint2 = false;
    isClickPoint3 = false;
    isClickPoint4 = false;
    isClickPoint5 = false;

  }
}

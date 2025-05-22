import 'package:archive_idea/data/idea_info.dart';
import 'package:archive_idea/screen/edit_screen.dart';
import 'package:archive_idea/screen/main_screen.dart';
import 'package:archive_idea/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archive_Idea',
      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
        '/':(context) => SplashScreen(),
        '/main':(context) => MainScreen(),//라우트설정
        },
      onGenerateRoute: (settings) {
        if(settings.name == '/edit') {
          //1.아이디어 기록값을 넘기지 못하면 작성시나리오
          //2.아이디어 기록값을 넘기면 수정시나리오
          final IdeaInfo? ideaInfo = settings.arguments as IdeaInfo?;
          return MaterialPageRoute(builder: (context) {
            return EditScreen(ideaInfo: ideaInfo,);
          },);
        }
      },
    );
  }
}

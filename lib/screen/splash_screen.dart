import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/main');
      },);

    return Scaffold(
      backgroundColor: Colors.white, //배경색 추가
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//주축정렬
          children: [
            Image.asset('assets/idea.png'),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'Archive Idea',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

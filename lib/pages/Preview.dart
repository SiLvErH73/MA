import 'package:flutter/material.dart';
import 'RegistrationPage.dart';  // Импортируем экран регистрации

class PreviewScreen extends StatefulWidget {
  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  double _imagePosition = 0.0;  // Начальная позиция изображения
  double _textPosition = 0.0;   // Начальная позиция текста

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Моя онлайн библиотека'),
        backgroundColor: Color(0xFFFF6F61),  // AppBar background color
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            _imagePosition += details.primaryDelta!;  // Обновить позицию изображения
            _textPosition += details.primaryDelta!;
          });
        },
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => RegistrationPage()),
            );
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF6F61), Color(0xFFFF9EAB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        Icons.book,
                        key: ValueKey(_imagePosition),
                        size: 100.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        'Моя онлайн библиотека',
                        key: ValueKey(_textPosition),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '/widgets/add_question_screen.dart';
import '/screens/quiz_screen.dart';
import 'package:quiz_app_tutorial/widgets/next_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(),
      home: const QuizScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RectangularButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              label: 'Start Quiz',
            ),
            SizedBox(height: 24),
            RectangularButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddQuestionScreen(),
                  ),
                );
              },
              label: 'Add Question',
            )
          ],
        ),
      ),
    );
  }
}

class ShareApp extends StatefulWidget {
  const ShareApp({Key? key}) : super(key: key);

  @override
  State<ShareApp> createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: (() {
              //Share.share("");
            }),
            child: const Text("Share App")),
      ),
    );
  }
}

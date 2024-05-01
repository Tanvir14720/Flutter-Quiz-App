import 'package:flutter/material.dart';
import 'package:quiz_app_tutorial/widgets/next_button.dart';
import '/models/questions.dart';
import 'quiz_screen.dart'; // Import your quiz screen directly
import 'package:quiz_app_tutorial/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalTimeInSeconds;

  const ResultScreen({
    Key? key,
    required this.score,
    required this.totalTimeInSeconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 16),
        Text(
          'Total Time: ${totalTimeInSeconds}s',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 24),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: score / 9,
                color: Colors.green,
                backgroundColor: Colors.white,
              ),
            ),
            Column(
              children: [
                Text(
                  score.toString(),
                  style: const TextStyle(fontSize: 80),
                ),
                const SizedBox(height: 10),
                Text(
                  '${(score / questions.length * 100).round()}%',
                  style: const TextStyle(fontSize: 25),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 24),
        RectangularButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => QuizScreen(),
              ),
            );
          },
          label: 'Start Again',
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.email),
              onPressed: () {
                _launchEmail();
              },
            ),
            IconButton(
              icon: const Icon(Icons.facebook),
              onPressed: () {
                _shareOnFacebook();
              },
            ),
          ],
        ),
      ])),
    );
  }

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '', // Add the recipient's email address here
      queryParameters: {
        'subject': 'Quiz Result',
        'body': 'My quiz result: Score - $score, Time - ${totalTimeInSeconds}s',
      },
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void _shareOnFacebook() {
    Share.share(
        'My quiz result: Score - $score, Time - ${totalTimeInSeconds}s');
  }

  void _shareOnInstagram() {
    Share.share(
        'My quiz result: Score - $score, Time - ${totalTimeInSeconds}s');
  }
}

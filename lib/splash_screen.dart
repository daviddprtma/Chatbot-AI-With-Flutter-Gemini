import 'package:chatbot_ai/chat_screen.dart';
import 'package:chatbot_ai/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> init(BuildContext context) async {
    await dotenv.load(fileName: ".env");
    Gemini.init(apiKey: dotenv.env['API_TOKEN'].toString());
    Future.delayed(const Duration(seconds: 1), () {
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bot Chat AI',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Text(
                'Powered By:',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Image.asset(
                'assets/images/gemini.png',
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}

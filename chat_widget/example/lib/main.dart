import 'package:flutter/material.dart';
import 'package:chat_widget/chat_widget.dart'; // replace with your actual package name

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Chat Widget Example')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SizedBox(
                width: constraints.maxWidth < 600 ? constraints.maxWidth : 400,
                child: ChatWidget(
                  initialMessages: [
                    ChatMessage(
                      sender: "Dana",
                      text: "Welcome 👋 to our website. How may I help you?",
                      tag: "Intro",
                    ),
                    ChatMessage(
                      sender: "Dana",
                      text: "Do you need advice or additional details about our offerings?",
                      editable: true,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

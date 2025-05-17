library chat_widget;
import 'package:flutter/material.dart';
import 'models/chat_message.dart';
import 'widgets/chat_bubble.dart';


export 'models/chat_message.dart';
export 'chat_widget.dart';

class ChatWidget extends StatefulWidget {
  final List<ChatMessage> initialMessages;
  final Function(String message)? onSend;

  const ChatWidget({
    super.key,
    required this.initialMessages,
    this.onSend,
  });

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _controller = TextEditingController();
  late List<ChatMessage> messages;

  @override
  void initState() {
    super.initState();
    messages = List.from(widget.initialMessages);
  }

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(ChatMessage(
        sender: "You",
        text: text,
        isUser: true,
      ));
    });

    widget.onSend?.call(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 420),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages.map((m) {
                return ChatBubble(
                  message: m,
                  onEdit: () {
                    print('Edit tapped for: ${m.text}');
                    // Optional: Show input dialog for editing
                  },
                );
              }).toList(),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Type Here ...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: sendMessage,
              ),
            ],
          )
        ],
      ),
    );
  }
}
@override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Center(
        child: SizedBox(
          width: constraints.maxWidth < 600 ? constraints.maxWidth : 400,
          child: ChatWidget(
            initialMessages: [
              ChatMessage(sender: "Dana", text: "Welcome 👋 to our website. How may I help you?", tag: "Intro"),
              ChatMessage(sender: "Dana", text: "Do you need advice or additional details about our offerings?", editable: true),
            ],
          ),
        ),
      );
    },
  );
}

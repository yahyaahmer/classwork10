class ChatMessage {
  final String sender;     // Name or ID of the message sender
  final String text;       // The actual message content
  final bool isUser;       // Whether the message is from the user
  final bool editable;     // Whether the message has an "Edit" option
  final String? tag;       // Optional tag like "Intro" or other labels

  ChatMessage({
    required this.sender,
    required this.text,
    this.isUser = false,
    this.editable = false,
    this.tag,
  });
}

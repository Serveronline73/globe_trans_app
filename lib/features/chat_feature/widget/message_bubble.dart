import 'package:flutter/material.dart';
import 'package:globe_trans_app/features/chat_feature/presentation/chat_screen.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final isSent = message.isSent;
    final dateFormat = DateFormat("HH:mm");

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSent ? const Color.fromARGB(255, 22, 174, 27) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: isSent
                  ? const Color.fromARGB(255, 22, 174, 27)
                  : Colors.grey),
        ),
        child: Column(
          crossAxisAlignment:
              isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(color: isSent ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              dateFormat.format(message.timestamp),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

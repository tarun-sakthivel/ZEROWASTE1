import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class msgbubble extends StatelessWidget {
  final String text, sender;
  final String? name;
  final bool isMe;
  final Timestamp time;

  const msgbubble(
      {super.key,
      required this.text,
      required this.sender,
      required this.name,
      required this.isMe,
      required this.time});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = time.toDate();
    String times = DateFormat.Hm().format(dateTime);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(name ?? "Anonomus"),
          Material(
              borderRadius: BorderRadius.only(
                  topLeft: isMe ? const Radius.circular(20) : const Radius.circular(0),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                  topRight: isMe ? const Radius.circular(0) : const Radius.circular(20)),
              elevation: 5,
              color: const Color(0xFFD9D9D9),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(text),
              )),
          Text(
            times,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

//MsgBubble
import 'package:zerowaste111/Components/MsgBubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MsgStream extends StatelessWidget {
  const MsgStream(
      {super.key, required FirebaseFirestore firestore, required this.user})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }
          final msgs = snapshot.data!.docs;
          List<msgbubble> msgwidgets = [];
          for (var msg in msgs) {
            final msgtext = msg.get('text');
            final msgsender = msg.get('user');
            final msgname = msg.get('name');
            final time = msg.get('timestamp');
            final currentuser = user!.email;

            final msgwidget = msgbubble(
                text: msgtext,
                sender: msgsender,
                name: msgname,
                isMe: msgsender == currentuser,
                time: time);
            msgwidgets.add(msgwidget);
          }
          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              reverse: true,
              children: msgwidgets,
            ),
          );
        });
  }
}

//MsgStream
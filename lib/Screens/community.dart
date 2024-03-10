import 'package:zerowaste111/Components/Constants.dart';
import 'package:zerowaste111/Components/MsgStream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zerowaste111/Components/bottom_navigation_bar.dart';

int _currentindex = 3;

class community extends StatefulWidget {
  const community({super.key});

  @override
  State<community> createState() => _communityState();
}

class _communityState extends State<community> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // late User loggedinuser;
  late User loggedinuser;
  late String message;
  TextEditingController msgcontroller = TextEditingController();

  void getuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomnavigator(
        index1: _currentindex,
      ),
      //backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Center(child: Text("Community", style: TextStyle(fontSize: 28))),
            MsgStream(firestore: _firestore, user: loggedinuser),
            Container(
              decoration: kMessageContainerDecoration,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: msgcontroller,
                          onChanged: (value) {
                            setState(() {
                              message = value;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: kMessageTextFieldDecoration,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        msgcontroller.clear();
                        _firestore.collection('messages').add({
                          'text': message,
                          'user': loggedinuser.email,
                          'name': loggedinuser.displayName,
                          'timestamp': Timestamp.now(),
                        });
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
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


//Community
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/view_info.dart';

class XyzView extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream1 =
      FirebaseFirestore.instance.collection('info').snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('XYZ')),
            bottom: TabBar(tabs: [
              Text('info'),
              Text('Team'),
              Text('skor'),
            ]),
          ),
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: collectionStream,
            builder: (context, snapshot) {
              return TabBarView(
                children: [
                  ViewInfo().dataFirestorenama(snapshot),
                  ViewInfo().dataFirestoreumur(snapshot),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: collectionStream1,
                    builder: (context, snapshot1) {
                      return ViewInfo().dataFirestore1(snapshot1);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

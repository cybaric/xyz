import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/view_info.dart';

class XyzView extends StatefulWidget {
  @override
  _XyzViewState createState() => _XyzViewState();
}

class _XyzViewState extends State<XyzView> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamTeam =
      FirebaseFirestore.instance.collection('team').snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamInfo =
      FirebaseFirestore.instance.collection('info').snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamPemain =
      FirebaseFirestore.instance.collection('pemain').snapshots();

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
              Text('pemain'),
            ]),
          ),
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: collectionStreamTeam,
            builder: (context, snapshotTeam) {
              return TabBarView(
                children: [
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: collectionStreamInfo,
                    builder: (context, snapshotInfo) {
                      return ViewInfo().dataInfo(snapshotInfo);
                    },
                  ),
                  ViewInfo().dataTeam(snapshotTeam),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: collectionStreamPemain,
                    builder: (context, snapshotPemain) {
                      return ViewInfo().dataPemain(snapshotPemain);
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

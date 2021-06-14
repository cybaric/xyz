import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/view_info.dart';
import 'package:xyz/view/view_pemain.dart';
import 'package:xyz/view/view_team.dart';

class XyzView extends StatefulWidget {
  @override
  _XyzViewState createState() => _XyzViewState();
}

class _XyzViewState extends State<XyzView> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamInfo =
      FirebaseFirestore.instance.collection('info').orderBy('skor').snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamTeam =
      FirebaseFirestore.instance.collection('team').orderBy('tahun').snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamPemain =
      FirebaseFirestore.instance.collection('pemain').orderBy('no').snapshots();

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
            body: TabBarView(
              children: [
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: collectionStreamInfo,
                  builder: (_, snapshotInfo) {
                    return ViewInfo().dataInfo(snapshotInfo);
                  },
                ),

                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: collectionStreamTeam,
                  builder: (_, snapshotTeam) {
                    return ViewTeam().dataTeam(snapshotTeam);
                  },
                ),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: collectionStreamPemain,
                  builder: (_, snapshotPemain) {
                    return ViewPemain().dataPemain(snapshotPemain);
                  },
                ),
                
              ],
            ),
          )),
    );
  }
}

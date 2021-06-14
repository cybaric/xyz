import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/view_info.dart';
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
      FirebaseFirestore.instance.collection('team').snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStreamPemain =
      FirebaseFirestore.instance.collection('pemain').snapshots();

  @override
  Widget build(BuildContext context) {
    //FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference data = firestore.collection('team');
    CollectionReference player = firestore.collection('player');
    TextEditingController controller = TextEditingController();

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
                ListView(
                  children: [
                    Container(
                      height: 500,
                      child: Column(
                        children: [
                          TextField(
                            controller: controller,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                data.add({'info': controller.text});
                                controller.text = '';
                              },
                              child: Text('buat')),
                        ],
                      ),
                    ),
                  ],
                ),

                // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                //   stream: collectionStreamPemain,
                //   builder: (context, snapshotPemain) {
                //     return ViewPemain().dataPemain(snapshotPemain);
                //   },
                // ),
              ],
            ),
          )),
    );
  }
}

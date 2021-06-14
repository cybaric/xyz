import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_info.dart';

class ViewInfo {
  CollectionReference info = FirebaseFirestore.instance.collection('info');

  ListView dataInfo(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotInfo) {
    return ListView.builder(
      itemCount: snapshotInfo.data!.docs.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            card(snapshotInfo, index),
            SizedBox(
              height: 5,
            ),
            if (index == snapshotInfo.data!.docs.length - 1)
              elevatedButton(context),
          ],
        );
      },
    );
  }

  ElevatedButton elevatedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddInfo();
          }));
        },
        child: Text('Add Info'));
  }

  Card card(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotInfo,
      int index) {
    return Card(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            snapshotInfo.data!.docs[index].data()['skor'] != '0000'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Versus : ' +
                          snapshotInfo.data!.docs[index]
                              .data()['vs']
                              .toString()),
                      Text('Skor Akhir : ' +
                          snapshotInfo.data!.docs[index]
                              .data()['skor']
                              .toString()),
                      Container(
                        width: 220,
                        child: Text(
                          'Waktu Gol : ' +
                              snapshotInfo.data!.docs[index]
                                  .data()['time']
                                  .toString(),
                          style: TextStyle(),
                          maxLines: 4,
                        ),
                      ),
                      Container(
                        width: 220,
                        child: Text(
                          'Pencetak Gol : ' +
                              snapshotInfo.data!.docs[index]
                                  .data()['pencetak gol']
                                  .toString(),
                          style: TextStyle(),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                    '         Info Pertandingan',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 24),
                  )),
            if (snapshotInfo.data!.docs[index].data()['skor'] != '0000')
              GestureDetector(
                  onTap: () {
                    info.doc(snapshotInfo.data!.docs[index].id).delete();
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.pinkAccent,
                  )),
          ],
        ),
      ),
    );
  }
}

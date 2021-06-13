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
          children: [if (snapshotInfo.data!.docs[index].data()['skor'] != '0000') // data awal agar button add muncul
            Column(
              children: [
                
                  Text('Skor Akhir : ' +
                      snapshotInfo.data!.docs[index].data()['skor'].toString()),
                
                  Text('Waktu Gol Pertama : ' +
                      snapshotInfo.data!.docs[index].data()['time'].toString()),
              ],
            ),
            if (snapshotInfo.data!.docs[index].data()['skor'] != '0000')
              GestureDetector(
                  onTap: () {
                    info.doc(snapshotInfo.data!.docs[index].id).delete();
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.pinkAccent,
                  ))
          ],
        ),
      ),
    );
  }
}

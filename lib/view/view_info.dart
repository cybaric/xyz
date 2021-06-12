import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewInfo {
  ListView dataInfo(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotInfo) {
    return ListView.builder(
      itemCount: snapshotInfo.data!.docs.length,
      itemBuilder: (context, index) {
        return Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(snapshotInfo.data!.docs[index].data()['skor'].toString()),
              Text(snapshotInfo.data!.docs[index]
                  .data()['waktu gol']
                  .toString()),
            ],
          ),
        );
      },
    );
  }
}

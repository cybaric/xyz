import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewPemain {
  ListView dataPemain(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotPemain) {
    return ListView.builder(
      itemCount: snapshotPemain.data!.docs.length,
      itemBuilder: (context, index) {
        return Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Nama Pemain : ' +
                  snapshotPemain.data!.docs[index].data()['nama'].toString()),
              Text('berat Pemain : ' +
                  snapshotPemain.data!.docs[index].data()['berat'].toString()),
              Text('No Punggung : ' +
                  snapshotPemain.data!.docs[index].data()['no'].toString()),
              Text('Posisi : ' +
                  snapshotPemain.data!.docs[index].data()['posisi'].toString()),
              Text('Tinggi Badan : ' +
                  snapshotPemain.data!.docs[index].data()['tinggi'].toString()),
            ],
          ),
        );
      },
    );
  }
}

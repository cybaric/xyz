import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewInfo {
  ListView tabInfo() {
    return ListView(
      children: [
        Column(
          children: [
            Text(''),
            ElevatedButton(onPressed: () {}, child: Text('a'))
          ],
        ),
      ],
    );
  }

  ListView dataTeam(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotTeam) {
    return ListView.builder(
      itemCount: snapshotTeam.data!.docs.length,
      itemBuilder: (context, index) {
        return Container(height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(snapshotTeam.data!.docs[index].data()['tim'].toString()),
              Text(snapshotTeam.data!.docs[index].data()['alamat'].toString()),
              Text(snapshotTeam.data!.docs[index].data()['kota'].toString()),
              Text(snapshotTeam.data!.docs[index].data()['tahun'].toString()),
            ],
          ),
        );
      },
    );
  }

  ListView dataInfo(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotInfo) {
    return ListView.builder(
      itemCount: snapshotInfo.data!.docs.length,
      itemBuilder: (context, index) {
        return Container(height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(snapshotInfo.data!.docs[index].data()['skor'].toString()),
              Text(snapshotInfo.data!.docs[index].data()['waktu gol'].toString()),
            ],
          ),
        );
      },
    );
  }

  ListView dataPemain(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotPemain) {
    return ListView.builder(
      itemCount: snapshotPemain.data!.docs.length,
      itemBuilder: (context, index) {
        return Container(height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Nama Pemain : ' + snapshotPemain.data!.docs[index].data()['nama'].toString()),
              Text('berat Pemain : ' + snapshotPemain.data!.docs[index].data()['berat'].toString()),
              Text('No Punggung : ' + snapshotPemain.data!.docs[index].data()['no'].toString()),
              Text('Posisi : ' + snapshotPemain.data!.docs[index].data()['posisi'].toString()),
              Text('Tinggi Badan : ' + snapshotPemain.data!.docs[index].data()['tinggi'].toString()),
            ],
          ),
        );
      },
    );
  }
}

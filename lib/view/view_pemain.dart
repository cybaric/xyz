import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/add_pemain.dart';

class ViewPemain {
  CollectionReference pemain = FirebaseFirestore.instance.collection('pemain');

  ListView dataPemain(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotPemain) {
    return ListView.builder(
      itemCount: snapshotPemain.data!.docs.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            card(snapshotPemain, index),
            SizedBox(
              height: 5,
            ),
            if (index == snapshotPemain.data!.docs.length - 1)
              elevatedButton1(context),
          ],
        );
      },
    );
  }

  ElevatedButton elevatedButton1(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddPemain();
          }));
        },
        child: Text('Tambah Pemain'));
  }

  Card card(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotPemain,
      int index) {
    return Card(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            snapshotPemain.data!.docs[index].data()['no'] != '0000'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama : ' +
                          snapshotPemain.data!.docs[index]
                              .data()['nama']
                              .toString()),
                      Text('Tinggi/Berat : ' +
                          snapshotPemain.data!.docs[index]
                              .data()['tinggi/berat']
                              .toString()),
                      Container(
                        width: 220,
                        child: Text(
                          'Posisi : ' +
                              snapshotPemain.data!.docs[index]
                                  .data()['posisi']
                                  .toString(),
                          style: TextStyle(),
                          maxLines: 4,
                        ),
                      ),
                      Container(
                        width: 220,
                        child: Text(
                          'no : ' +
                              snapshotPemain.data!.docs[index]
                                  .data()['nomor']
                                  .toString(),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                    '               Info Pemain',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 24),
                  )),
            if (snapshotPemain.data!.docs[index].data()['no'] != '0000')
              GestureDetector(
                  onTap: () {
                    pemain.doc(snapshotPemain.data!.docs[index].id).delete();
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

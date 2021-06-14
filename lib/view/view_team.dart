import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/add_team.dart';

class ViewTeam {
  CollectionReference team = FirebaseFirestore.instance.collection('team');

  ListView dataTeam(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotTeam) {
    return ListView.builder(
      itemCount: snapshotTeam.data!.docs.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            card(snapshotTeam, index),
            SizedBox(
              height: 5,
            ),
            if (index == snapshotTeam.data!.docs.length - 1)
              elevatedButton2(context),
          ],
        );
      },
    );
  }

  ElevatedButton elevatedButton2(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTeam();
          }));
        },
        child: Text('Tambah Tim'));
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
            snapshotPemain.data!.docs[index].data()['tahun'] != '0000'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama : ' +
                          snapshotPemain.data!.docs[index]
                              .data()['nama']
                              .toString()),
                      Text('Tahun : ' +
                          snapshotPemain.data!.docs[index]
                              .data()['tahun']
                              .toString()),
                      Container(
                        width: 220,
                        child: Text(
                          'Alamat : ' +
                              snapshotPemain.data!.docs[index]
                                  .data()['alamat']
                                  .toString(),
                          style: TextStyle(),
                          maxLines: 4,
                        ),
                      ),
                      Container(
                        width: 220,
                        child: Text(
                          'Kota : ' +
                              snapshotPemain.data!.docs[index]
                                  .data()['kota']
                                  .toString(),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                    '                 Info Tim',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 24),
                  )),
            if (snapshotPemain.data!.docs[index].data()['tahun'] != '0000')
              GestureDetector(
                  onTap: () {
                    team.doc(snapshotPemain.data!.docs[index].id).delete();
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


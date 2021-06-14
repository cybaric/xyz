import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewTeam {
  ListView dataTeam(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshotTeam) {
    return ListView.builder(
      itemCount: snapshotTeam.data!.docs.length,
      itemBuilder: (context, index) {
        return Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 200,
                child: Column(children: [
                  Text(snapshotTeam.data!.docs[index].data()['alamat'].toString()),
                  Text(snapshotTeam.data!.docs[index]
                      .data()['alamat']
                      .toString()),
                  Text(
                      snapshotTeam.data!.docs[index].data()['tahun dibentuk'].toString()),
                  Text(snapshotTeam.data!.docs[index]
                      .data()['nama pemain']
                      .toString()),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

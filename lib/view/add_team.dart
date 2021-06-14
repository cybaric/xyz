import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTeam extends StatefulWidget {
  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference team = firestore.collection('team');
    TextEditingController controllerAddNama = TextEditingController();
    TextEditingController controllerAddTahun = TextEditingController();
    TextEditingController controllerAddAlamat = TextEditingController();
    TextEditingController controllerAddKota = TextEditingController();

    return Scaffold(
      body: Container(
        width: 350,
        height: 500,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Tambah Tim'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Nama    : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddNama,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Tahun bentuk : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddTahun,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Alamat    : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddAlamat,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Kota      : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddKota,
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                team.add({
                  'nama': controllerAddNama.text,
                  'tahun': controllerAddTahun.text,
                  'alamat': controllerAddAlamat.text,
                  'kota': controllerAddKota.text
                });
                controllerAddNama.text = 'saved';
                controllerAddTahun.text = 'saved';
                controllerAddAlamat.text = 'saved';
                controllerAddKota.text = 'saved';
              },
              child: Text('Tambah Tim'))
        ]),
      ),
    );
  }
}

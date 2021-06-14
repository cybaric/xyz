import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPemain extends StatefulWidget {
  @override
  _AddPemainState createState() => _AddPemainState();
}

class _AddPemainState extends State<AddPemain> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference pemain = firestore.collection('pemain');
    TextEditingController controllerAddNama = TextEditingController();
    TextEditingController controllerAddTinggiBerat = TextEditingController();
    TextEditingController controllerAddPosisi = TextEditingController();
    TextEditingController controllerAddNo = TextEditingController();

    return Scaffold(
      body: Container(
        width: 350,
        height: 500,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('add pemain'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nama : '),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tinggi/Berat : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddTinggiBerat,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Posisi : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddPosisi,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nomor : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddNo,
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                pemain.add({
                  'nama': controllerAddNama.text,
                  'tinggi/berat': controllerAddTinggiBerat.text,
                  'posisi': controllerAddPosisi.text,
                  'nomor': controllerAddNo.text
                });
                controllerAddNama.text = 'saved';
                controllerAddTinggiBerat.text = 'saved';
                controllerAddPosisi.text = 'saved';
                controllerAddNo.text = 'saved';
              },
              child: Text('Add'))
        ]),
      ),
    );
  }
}

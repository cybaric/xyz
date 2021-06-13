import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference info = firestore.collection('info');
    TextEditingController controllerAddSkor = TextEditingController();
    TextEditingController controllerAddTime = TextEditingController();

    return Scaffold(
      body: Container(
        width: 350,
        height: 500,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('add info'),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Skor : '),
              Container(
                height: 40,
                width: 100,
                child: TextField(
                  controller: controllerAddSkor,
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Time : '),
              Container(
                height: 40,
                width: 100,
                child: TextField(
                  controller: controllerAddTime,
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                info.add({
                  'skor': controllerAddSkor.text,
                  'time': controllerAddTime.text
                });
                controllerAddSkor.text = 'berhasil';
                controllerAddTime.text = 'berhasil';
              },
              child: Text('Add'))
        ]),
      ),
    );
  }
}

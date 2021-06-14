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
    TextEditingController controllerAddVs = TextEditingController();
    TextEditingController controllerAddSkor = TextEditingController();
    TextEditingController controllerAddTime = TextEditingController();
    TextEditingController controllerAddGoalscorer = TextEditingController();

    return Scaffold(
      body: Container(
        width: 350,
        height: 500,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('add info'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('add Vs : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddVs,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Skor : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddSkor,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Time : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddTime,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Goalscorer : '),
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: controllerAddGoalscorer,
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                info.add({
                  'vs': controllerAddVs.text,
                  'skor': controllerAddSkor.text,
                  'time': controllerAddTime.text,
                  'pencetak gol': controllerAddGoalscorer.text
                });
                controllerAddVs.text = 'saved';
                controllerAddSkor.text = 'saved';
                controllerAddTime.text = 'saved';
                controllerAddGoalscorer.text = 'saved';
              },
              child: Text('Add'))
        ]),
      ),
    );
  }
}

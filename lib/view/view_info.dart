import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewInfo{

  
  ListView tabInfo() {
    return ListView(children: [
            Column(children: [
              Text(''),
              ElevatedButton(onPressed: (){}, child: Text('a'))
            ],),
          ],);
  }

ListView dataFirestorenama(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]
                          .data()['nama']
                          .toString()),
                    );
                  },
                );
  }

  ListView dataFirestoreumur(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]
                          .data()['umur']
                          .toString()),
                    );
                  },
                );
  }


ListView dataFirestore1(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot1) {
    return ListView.builder(
                  itemCount: snapshot1.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot1.data!.docs[index]
                          .data()['hari']
                          .toString()),
                    );
                  },
                );
  }
}



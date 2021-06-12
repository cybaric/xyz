import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xyz/view/xyz_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Error'),
                ),
              );
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return XyzView();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Scaffold(
              appBar: AppBar(
                title: Text('Loading'),
              ),
            );
          },
        ));
  }
}

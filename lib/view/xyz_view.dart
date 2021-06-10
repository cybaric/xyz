import 'package:flutter/material.dart';
import 'package:xyz/view/view_info.dart';

class XyzView extends StatelessWidget {
  const XyzView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('XYZ')),
            bottom: TabBar(tabs: [
              Text('info'),
              Text('Team'),
              Text('skor'),
            ]),
          ),
          body: TabBarView(children: [
            ViewInfo().tabInfo(),
            Text('b'),
            Text('c'),
          ],),
        ),
      ),
    );
  }

  
}

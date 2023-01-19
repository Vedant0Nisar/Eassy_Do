import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:navigationbar/pages/completed.dart';
import 'package:navigationbar/pages/dashoard.dart';
import 'package:navigationbar/pages/pending.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List _screens = [dashboard(),completed(),pending()];
  int _selectedindex = 0;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,

      appBar: AppBar(

        title: Center(child: Text('Easy Do ', style: TextStyle(fontSize: 20, color: Colors.black) ,)),
        backgroundColor: Colors.blue.shade500,
        elevation: 5,
      ),

      bottomNavigationBar: CurvedNavigationBar(

        color: Colors.blue.shade500,
        backgroundColor: Colors.transparent,
        height: 60,
        buttonBackgroundColor: Colors.blue.shade200,
        animationCurve: Curves.bounceOut,
        index: _selectedindex,
        items: <Widget>[
          Icon(Icons.task_sharp, size: 35),
          Icon(Icons.done_all_rounded, size: 35),
          Icon(Icons.pending_actions_rounded, size: 35),
        ],
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
      ),
      body: _screens[_selectedindex],
    );
  }
}

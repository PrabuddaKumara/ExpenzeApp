import 'package:demo/util/color.dart';
import 'package:flutter/material.dart';

class BottonNavigatinPage extends StatefulWidget {
  const BottonNavigatinPage({super.key});

  @override
  State<BottonNavigatinPage> createState() => _BottonNavigatinPageState();
}

class _BottonNavigatinPageState extends State<BottonNavigatinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: kGreen,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transcation",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(shape: BoxShape.circle),

              child: Icon(Icons.add, size: 20, color: kMainColor),
            ),label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Buget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

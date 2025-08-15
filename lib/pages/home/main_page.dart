import 'package:demo/util/color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transcation",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: kMainColor,

                shape: BoxShape.circle,
              ),

              child: Icon(Icons.add, size: 30,
               color: kWhite,),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Buget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

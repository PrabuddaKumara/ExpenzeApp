import 'package:demo/pages/home/add_page.dart';
import 'package:demo/pages/home/buggect_page.dart';
import 'package:demo/pages/home/home_page.dart';
import 'package:demo/pages/home/profile_page.dart';
import 'package:demo/pages/home/transaction_page.dart';
import 'package:demo/util/color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  //current index
  int _currentpage=0;


  final List<Widget> _pages = [
    HomePage(),
    Transctionpage(),
    AddPage(),
    BuggectPage(),
    Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentpage,
        onTap:(index) {
          setState(() {
            _currentpage=index;
          });
          
        },
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

              child: Icon(Icons.add, size: 30, color: kWhite),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Buget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body:_pages[_currentpage]

    );
  }
}

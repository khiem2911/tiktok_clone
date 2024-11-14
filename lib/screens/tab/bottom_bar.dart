import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/home/home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomBarState();
  }
}

class _BottomBarState extends State<BottomBar> {
  var index = 0;
  Widget avtiveScreen = const Home();

  void _onTapItem(int current) {
    setState(() {
      index = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      avtiveScreen = const Home();
    }

    return Scaffold(
      body: avtiveScreen,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) => _onTapItem(value),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Me')
          ]),
    );
  }
}

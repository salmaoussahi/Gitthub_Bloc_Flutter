import 'package:flutter/material.dart';
import 'package:githubbloc/github.repo/pages/github.repo.page.dart';
import 'package:githubbloc/github.user/pages/github.users.page.dart';
import 'package:githubbloc/pages/home.page.dart';

class BottomNavigationBarMenu extends StatefulWidget {
  const BottomNavigationBarMenu({Key key}) : super(key: key);

  @override
  State<BottomNavigationBarMenu> createState() =>
      _BottomNavigationBarMenuState();
}

class _BottomNavigationBarMenuState extends State<BottomNavigationBarMenu> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    UsersPage(),
    RepoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
              backgroundColor: Colors.transparent,
              radius: 15,
            ),
            SizedBox(width: 20,),
            Text('Github App'),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'Github Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_shared_sharp),
            label: 'Most rated repos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

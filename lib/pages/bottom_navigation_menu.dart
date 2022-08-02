import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:githubbloc/github.repo/pages/github.repo.page.dart';
import 'package:githubbloc/github.user/pages/github.users.page.dart';
import 'package:githubbloc/main.dart';
import 'package:githubbloc/pages/home.page.dart';
import 'package:toggle_switch/toggle_switch.dart';

class BottomNavigationBarMenu extends StatefulWidget {
  const BottomNavigationBarMenu({Key key}) : super(key: key);

  @override
  State<BottomNavigationBarMenu> createState() =>
      _BottomNavigationBarMenuState();
}

class _BottomNavigationBarMenuState extends State<BottomNavigationBarMenu> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // Home(),
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
            SizedBox(
              width: 20,
            ),
            Text('Github App'),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          // ToggleSwitch(
          //   minWidth: 70.0,
          //   minHeight: 50.0,
          //   initialLabelIndex: 0,
          //   cornerRadius: 20.0,
          //   activeFgColor: Colors.white,
          //   inactiveBgColor: Colors.grey,
          //   inactiveFgColor: Colors.white,
          //   totalSwitches: 2,
          //   icons: [
          //     FontAwesomeIcons.lightbulb,
          //     FontAwesomeIcons.solidLightbulb,
          //   ],
          //   iconSize: 30.0,
          //   activeBgColors: [
          //     [Colors.black45, Colors.black26],
          //     [Colors.yellow, Colors.orange]
          //   ],
          //   animate:
          //       true, // with just animate set to true, default curve = Curves.easeIn
          //   curve: Curves
          //       .bounceInOut, // animate must be set to true when using custom curve
          //   onToggle: (index) {
          //     print('switched to: $index');
          //   },
          // ),

            IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,color: Colors.white,),
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              })
        ],
      ),
        
    
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
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

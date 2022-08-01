import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubbloc/pages/bottom_navigation_menu.dart';

import 'github.user/bloc/users.bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UsersBloc())],
      child: const MaterialApp(
        title: "GitHub App",
        home: BottomNavigationBarMenu(),
      ),
    );
  }
}

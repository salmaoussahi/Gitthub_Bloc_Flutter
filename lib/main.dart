import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubbloc/pages/bottom_navigation_menu.dart';
import 'package:githubbloc/pages/splash_screen.dart';

import 'github.user/bloc/users.bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
   static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = ThemeMode.light;
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UsersBloc())],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
         builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Github App',
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const SplashSceen(),
          );
        }
        // child: const MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   title: "GitHub App",
        //   home: SplashSceen(),
          
      
        ),
      
    );
  }
}

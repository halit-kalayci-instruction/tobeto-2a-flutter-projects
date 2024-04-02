import 'package:flutter/material.dart';
import 'package:miniblog/themes/dark_theme.dart';
import 'package:miniblog/themes/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _readThemeData();
  }

  _readThemeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isDark = preferences.getBool("DARKTHEME");
    if (isDark != null && isDark) {
      setState(() {
        themeMode = ThemeMode.dark;
      });
    }
  }

  _changeTheme(bool value) {
    setState(() {
      themeMode = value ? ThemeMode.dark : ThemeMode.light; // Sync
      _writeThemeData(value);
    });
  }

  // Veri yazmak, veri okumak
  // Http cevabı beklemek
  _writeThemeData(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("DARKTHEME", value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Merhaba"),
            Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  _changeTheme(value);
                })
          ]),
        ),
      ),
    );
  }
}

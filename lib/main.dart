import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/pages/signup_page.dart';
import 'package:tixket/provider/theme_provider.dart';
import 'package:tixket/provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark
          ),
          themeMode: Provider.of<ThemeProvider>(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SignUpPage()
        );
      }
    );
  }
}
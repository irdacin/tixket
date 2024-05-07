import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/pages/login_page.dart';
import 'package:tixket/providers/notification_provider.dart';
import 'package:tixket/providers/theme_provider.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: LightTheme().theme,
          darkTheme: DarkTheme().theme,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          home: const LoginPage()
        );
      }
    );
  }
}
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/pages/auth/login_page.dart';
import 'package:tixket/providers/favorite_movie_provider.dart';
import 'package:tixket/providers/notification_provider.dart';
import 'package:tixket/providers/theme_provider.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/local_notifications.dart';
import 'package:tixket/utils/theme.dart';

void main() async {
  if (!kIsWeb) { // Check if the app is running on the web
    WidgetsFlutterBinding.ensureInitialized();
    await LocalNotifications.init();
  }

  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteMovieProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorObservers: [routeObserver],
          theme: LightTheme().theme,
          darkTheme: DarkTheme().theme,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          home: const LoginPage()
        );
      }
    );
  }
}
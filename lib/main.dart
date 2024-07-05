import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/pages/onboarding/onboarding_page.dart';
import 'package:tixket/providers/booking_history_provider.dart';
import 'package:tixket/providers/favorite_movie_provider.dart';
import 'package:tixket/providers/notification_provider.dart';
import 'package:tixket/providers/payment_method_provider.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProxyProvider<UserProvider, NotificationProvider>(
          create: (context) => NotificationProvider(Provider.of<UserProvider>(context, listen: false)),
          update: (context, userProvider, notificationProvider) => NotificationProvider(userProvider),
        ),
        ChangeNotifierProxyProvider<UserProvider, PaymentMethodProvider>(
          create: (context) => PaymentMethodProvider(Provider.of<UserProvider>(context, listen: false)),
          update: (context, userProvider, paymentMethodProvider) => PaymentMethodProvider(userProvider),
        ),
        ChangeNotifierProxyProvider<UserProvider, FavoriteMovieProvider>(
          create: (context) => FavoriteMovieProvider(Provider.of<UserProvider>(context, listen: false)),
          update: (context, userProvider, favoriteMovieProvider) => FavoriteMovieProvider(userProvider),
        ),
        ChangeNotifierProxyProvider<UserProvider, BookingHistoryProvider>(
          create: (context) => BookingHistoryProvider(Provider.of<UserProvider>(context, listen: false)),
          update: (context, userProvider, bookingHistoryProvider) => BookingHistoryProvider(userProvider),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: LightTheme().theme,
          darkTheme: DarkTheme().theme,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          home: const OnboardingPage()
        );
      }
    );
  }
}
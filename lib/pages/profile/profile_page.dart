import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/profile_menu.dart';
import 'package:tixket/pages/home/booking_history_page.dart';
import 'package:tixket/pages/profile/appearance_page.dart';
import 'package:tixket/pages/auth/login_page.dart';
import 'package:tixket/pages/profile/account_page.dart';
import 'package:tixket/pages/profile/notification_page.dart';
import 'package:tixket/pages/home/favorite_page.dart';
import 'package:tixket/providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Provider.of<UserProvider>(context).currentUser!.profilePicture == null 
                ? CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 80,
                  )
                )
                : CircleAvatar(
                  radius: 25,
                  backgroundImage:MemoryImage(Provider.of<UserProvider>(context).currentUser!.profilePicture!),
                )
              ),
              const SizedBox(height: 10),
              Text(
                Provider.of<UserProvider>(context).currentUser!.username,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 5),
              Text(
                Provider.of<UserProvider>(context).currentUser!.email,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
                child: Column(
                  children: [
                    ProfileMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const AccountPage())
                        );
                      }, 
                      title: "Account", 
                      icon: Icons.account_circle_rounded,
                      iconColor: Colors.blueAccent,
                    ),
                    ProfileMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const NotificationPage())
                        );
                      }, 
                      title: "Notifications", 
                      icon: Icons.notifications,
                      iconColor: Colors.blueAccent,
                    ),
                    ProfileMenu(
                      onPressed: () { 
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const AppearancePage())
                        );
                      }, 
                      title: "Appearance", 
                      icon: Icons.color_lens,
                      iconColor: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
                child: Column(
                  children: [
                    ProfileMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const FavoritePage())
                        );
                      }, 
                      title: "Favorite", 
                      icon: Icons.favorite,
                      iconColor: Colors.blueAccent,
                    ),
                    ProfileMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const BookingHistoryPage())
                        );
                      }, 
                      title: "History Booking", 
                      icon: Icons.history,
                      iconColor: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
                child: ProfileMenu(
                  onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                          title: const Text("Log Out"),
                          titleTextStyle: Theme.of(context).textTheme.headlineMedium,
                          content: const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "CANCEL",
                                style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.blue),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const LoginPage()), 
                                  (route) => false
                                );
                                Provider.of<UserProvider>(context, listen: false).logOut();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white
                              ),
                              child: Text(
                                "LOG OUT", 
                                style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                              ),
                            )
                          ],
                        );
                      }
                    );
                  },
                  title: "Log out", 
                  textColor: Colors.red,
                  icon: Icons.logout,
                  iconColor: Colors.redAccent,
                  endIcon: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
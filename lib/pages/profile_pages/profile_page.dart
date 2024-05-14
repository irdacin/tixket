import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/profile_menu.dart';
import 'package:tixket/pages/profile_pages/appearance_settings.dart';
import 'package:tixket/pages/auth_pages/login_page.dart';
import 'package:tixket/pages/profile_pages/notification_settings.dart';
import 'package:tixket/pages/wishlist_pages/wishlist_page.dart';
import 'package:tixket/providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.headlineLarge,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/${Provider.of<UserProvider>(context).currentUser?.profilePicture}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                Provider.of<UserProvider>(context).currentUser!.username,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(200, 40),
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ), 
                child: const Text("Edit Profile"),
              ),
              const SizedBox(height: 30),
              const Divider(height: 20, thickness: 1,),
              const SizedBox(height: 10),
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
                          MaterialPageRoute(builder: (context) => const NotificationSettings(),)
                        );
                      }, 
                      title: "Notifications", 
                      icon: Icons.notifications,
                      iconColor: Colors.blueAccent,
                    ),
                    ProfileMenu(
                      onPressed: () { 
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const AppearanceSettings(),)
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
              const Divider(height: 20, thickness: 1,),
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
                          MaterialPageRoute(builder: (context) => const WishlistPage(),)
                        );
                      }, 
                      title: "Wishlist", 
                      icon: Icons.favorite,
                      iconColor: Colors.blueAccent,
                    ),
                    ProfileMenu(
                      onPressed: () {}, 
                      title: "History Booking", 
                      icon: Icons.history,
                      iconColor: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(height: 20, thickness: 1,),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
                child: ProfileMenu(
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginPage()), 
                      (route) => false
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
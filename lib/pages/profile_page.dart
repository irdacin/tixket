import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/profile_menu.dart';
import 'package:tixket/pages/login_page.dart';
import 'package:tixket/providers/theme_provider.dart';
import 'package:tixket/providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.headlineLarge,),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            )
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
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
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenu(
              onPressed: (){}, 
              title: "Settings", 
              icon: Icons.settings,
              iconColor: Colors.blueAccent,
            ),
            const SizedBox(height: 5),
            ProfileMenu(
              onPressed: (){}, 
              title: "History Booking", 
              icon: Icons.history,
              iconColor: Colors.blueAccent,
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            ProfileMenu(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage(),), 
                  (route) => false
                );
              }, 
              title: "Log out", 
              textColor: Colors.red,
              icon: Icons.logout,
              iconColor: Colors.redAccent,
              endIcon: false,
            )
          ],
        ),
      ),
    );
  }
}
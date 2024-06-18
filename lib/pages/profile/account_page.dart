import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/account_menu.dart';
import 'package:tixket/pages/auth/login_page.dart';
import 'package:tixket/pages/profile/update_email_page.dart';
import 'package:tixket/pages/profile/update_name_page.dart';
import 'package:tixket/pages/profile/update_password_page.dart';
import 'package:tixket/pages/profile/update_username_page.dart';
import 'package:tixket/providers/user_provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account", style: Theme.of(context).textTheme.headlineMedium),
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
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: currentUser!.profilePicture.isEmpty ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 80,
                  ) : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(currentUser!.profilePicture),
                        fit: BoxFit.cover,
                      )
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {}, 
                child: Text(
                  "Change Profile Picture",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.blue),
                )
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
                child: Column(
                  children: [
                    AccountMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const UpdateNamePage())
                        );
                      }, 
                      title: "Name", 
                      titleDetail: currentUser?.name ?? ""
                    ),
                    AccountMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const UpdateUsernamePage())
                        );
                      }, 
                      title: "Username", 
                      titleDetail: currentUser?.username ?? ""
                    ),
                    AccountMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const UpdateEmailPage())
                        );
                      }, 
                      title: "Email", 
                      titleDetail: currentUser?.email ?? ""
                    ),
                    AccountMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const UpdatePasswordPage())
                        );
                      }, 
                      title: "Password", 
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                          title: const Text("Delete Account"),
                          titleTextStyle: Theme.of(context).textTheme.headlineMedium,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Are you sure you want to delete your account permanently?",
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "By doing this, your account will be deleted permanently and you will not able to recover your account anymore",
                                style: Theme.of(context).textTheme.displayMedium,
                              )
                            ],
                          ),
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
                                Provider.of<UserProvider>(context, listen: false).delete();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white
                              ),
                              child: Text(
                                "DELETE", 
                                style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }, 
                  child: Text(
                    "Delete Account",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.red),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
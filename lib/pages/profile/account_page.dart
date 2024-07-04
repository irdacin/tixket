import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context, 
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: const Border.fromBorderSide(
                                      BorderSide(color: Colors.blue)
                                    ),
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      XFile? pickedFile = await ImagePicker().pickImage(
                                        source: ImageSource.camera
                                      );
                            
                                      Uint8List newImage = await pickedFile!.readAsBytes();
                                      Provider.of<UserProvider>(context, listen: false).updateImage(newImage);
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.camera_alt, color: Colors.blue)
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Take Picture",
                                  style: Theme.of(context).textTheme.displayMedium,
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: const Border.fromBorderSide(
                                      BorderSide(color: Colors.blue)
                                    ),
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      XFile? pickedFile = await ImagePicker().pickImage(
                                        source: ImageSource.gallery
                                      );
                            
                                      Uint8List newImage = await pickedFile!.readAsBytes();
                                      Provider.of<UserProvider>(context, listen: false).updateImage(newImage);
                                      // UpdateUserDetail().updateImage(Provider.of<UserProvider>(context).currentUser!.username, newImage);
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.image, color: Colors.blue),
                                  )
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "From Gallery",
                                  style: Theme.of(context).textTheme.displayMedium,
                                )
                              ],
                            ),
                          ]
                        ),
                      );
                    },
                  );
                },
                child: Stack(
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
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      )
                    )
                  ],
                ),
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
                      titleDetail: Provider.of<UserProvider>(context).currentUser?.name ?? ""
                    ),
                    AccountMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const UpdateUsernamePage())
                        );
                      }, 
                      title: "Username", 
                      titleDetail: Provider.of<UserProvider>(context).currentUser?.username ?? ""
                    ),
                    AccountMenu(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const UpdateEmailPage())
                        );
                      }, 
                      title: "Email", 
                      titleDetail: Provider.of<UserProvider>(context).currentUser?.email ?? ""
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
import 'package:flutter/material.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/pages/profile/account_page.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/update_user_detail.dart';
import 'package:tixket/utils/validator.dart';

class UpdateUsernamePage extends StatefulWidget {
  const UpdateUsernamePage({super.key});

  @override
  State<UpdateUsernamePage> createState() => _UpdateUsernamePageState();
}

class _UpdateUsernamePageState extends State<UpdateUsernamePage> {
  TextEditingController usernameController = TextEditingController(text: currentUser?.username ?? "");
  FocusNode focusNodeUsername = FocusNode();
  bool isChanged = false;
  bool isErrorTextUsername = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Username"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(
              controller: usernameController,
              icon: Icons.person,
              focusNode: focusNodeUsername,
              validator: (value) => Validator().validateUsername(value),
              onChanged: (value) {
                setState(() {
                  isChanged = value != currentUser!.username;
                  isErrorTextUsername = false;
                });
              },
              errorText: isErrorTextUsername ? "Username already exists" : null,
              labelText: "Username",
            ),
            const SizedBox(height: 40),
            LoadingButton(
              onPressed: isChanged && usernameController.text.isNotEmpty ? () {
                setState(() {
                  isErrorTextUsername = Validator().validateUsernameSignUp(usernameController.text);
                });

                if(isErrorTextUsername) {
                  return;
                }
                
                UpdateUserDetail().updateUsername(currentUser!.email, usernameController.text);
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AccountPage())
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Username has been successfully updated",
                      style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blue,
                  )
                );
              } : null, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isChanged && usernameController.text.isNotEmpty ? Colors.blue : const Color(0xffaaaaaa),
                textStyle: Theme.of(context).textTheme.bodyMedium,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              label: "Save"
            )
          ],
        ),
      ),
    );
  }
}
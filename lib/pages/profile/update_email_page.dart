import 'package:flutter/material.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/pages/profile/account_page.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/update_user_detail.dart';
import 'package:tixket/utils/validator.dart';

class UpdateEmailPage extends StatefulWidget {
  const UpdateEmailPage({super.key});

  @override
  State<UpdateEmailPage> createState() => _UpdateEmailPageState();
}

class _UpdateEmailPageState extends State<UpdateEmailPage> {
  TextEditingController emailController = TextEditingController(text: currentUser?.email ?? "");
  FocusNode focusNodeEmail = FocusNode();
  bool isChanged = false;
  bool isErrorTextEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(
              controller: emailController,
              icon: Icons.email,
              focusNode: focusNodeEmail,
              validator: (value) => Validator().validateEmail(value),
              onChanged: (value) {
                setState(() {
                  isChanged = value != currentUser!.email;
                  isErrorTextEmail = false;
                });
              },
              errorText: isErrorTextEmail ? "Email already exists" : null,
              labelText: "Email",
            ),
            const SizedBox(height: 40),
            LoadingButton(
              onPressed: isChanged && emailController.text.isNotEmpty ? () {
                setState(() {
                  isErrorTextEmail = Validator().validateEmailSignUp(emailController.text);
                });

                if(isErrorTextEmail) {
                  return;
                }
                
                UpdateUserDetail().updateEmail(currentUser!.username, emailController.text);
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AccountPage())
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Email has been successfully updated",
                      style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blue,
                  )
                );
              } : null, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isChanged && emailController.text.isNotEmpty ? Colors.blue : const Color(0xffaaaaaa),
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
import 'package:flutter/material.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/data/user_data.dart';
import 'package:tixket/pages/auth/login_page.dart';
import 'package:tixket/utils/validator.dart';

class CreateNewPasswordPage extends StatefulWidget {
  final String email;
  const CreateNewPasswordPage({
    super.key, 
    required this.email
  });

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isErrorText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set a new password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  "Create a new password. Ensure it differs from previous ones for security.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 40),
                InputField(
                  controller: passwordController,
                  labelText: "New password",
                  icon: Icons.lock,
                  isVisible: isPasswordVisible,
                  focusNode: focusNodePassword,
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible ^= true;
                      });
                    },
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  validator: (value) => Validator().validatePassword(value),
                  errorText: isErrorText ? "Wrong Username or Password" : null,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: confirmPasswordController,
                  labelText: "Confirm password",
                  focusNode: focusNodeConfirmPassword,
                  icon: Icons.lock,
                  isVisible: isConfirmPasswordVisible,
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible ^= true;
                        });
                      },
                      icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                    validator: (value) => Validator().validateConfirmPassword(value, passwordController.text),
                ),
                const SizedBox(height: 50),
                LoadingButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      int index = -1;
                      for(int i = 0; i < users.length; i++) {
                        if(users[i].email == widget.email) {
                          index = i;
                        }
                      }
                      if(index == -1) return;
                      users[index].password = passwordController.text;
                      
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Succesful",
                                    style: Theme.of(context).textTheme.headlineLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Congratulations!\nYour password has been changed. Click continue to login",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      minimumSize: const Size(double.infinity, 0),
                                      padding: const EdgeInsets.all(10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      textStyle: Theme.of(context).textTheme.bodyMedium
                                    ), 
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const LoginPage()),
                                        (route) => false,
                                      );
                                    }, 
                                    child: const Text("Continue")
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }, 
                  label: "Reset Password"
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
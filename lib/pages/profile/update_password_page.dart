import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/validator.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode focusNodeCurrentPassword = FocusNode();
  FocusNode focusNodeNewPassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();

  bool isErrorPassword = false;
  final formKey = GlobalKey<FormState>();

  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  bool isCurrentPasswordEmpty = true;
  bool isNewPasswordEmpty = true;
  bool isConfirmPasswordEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InputField(
                controller: currentPasswordController,
                icon: Icons.lock,
                validator: (value) => Validator().generalValidation(value, "Password"),
                onChanged: (value) {
                  setState(() {
                    isCurrentPasswordEmpty = value.isEmpty;  
                  });
                },
                focusNode: focusNodeCurrentPassword,
                isVisible: isCurrentPasswordVisible,
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isCurrentPasswordVisible ^= true;
                    });
                  },
                  icon: Icon(isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off),
                ),
                errorText: isErrorPassword ? "Wrong Password" : null,
                labelText: "Current Password",
              ),
              const SizedBox(height: 20),
              InputField(
                controller: newPasswordController,
                icon: Icons.lock,
                validator: (value) => Validator().validatePassword(value),
                onChanged: (value) {
                  setState(() {
                    isNewPasswordEmpty = value.isEmpty;  
                  });
                },
                focusNode: focusNodeNewPassword,
                isVisible: isNewPasswordVisible,
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isNewPasswordVisible ^= true;
                    });
                  },
                  icon: Icon(isNewPasswordVisible ? Icons.visibility : Icons.visibility_off),
                ),
                labelText: "New Password",
              ),
              const SizedBox(height: 20),
              InputField(
                controller: confirmPasswordController,
                icon: Icons.lock,
                validator: (value) => Validator().validateConfirmPassword(value, newPasswordController.text),
                onChanged: (value) {
                  setState(() {
                    isConfirmPasswordEmpty = value.isEmpty;  
                  });
                },
                focusNode: focusNodeConfirmPassword,
                isVisible: isConfirmPasswordVisible,
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible ^= true;
                    });
                  },
                  icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                ),
                labelText: "Confirm Password",
              ),
              const SizedBox(height: 40),
              LoadingButton(
                onPressed: !isCurrentPasswordEmpty && !isCurrentPasswordEmpty && !isConfirmPasswordEmpty ? () {
                  setState(() {
                    isErrorPassword = !Validator().checkPassword(Provider.of<UserProvider>(context, listen: false).currentUser!.username, currentPasswordController.text);
                  });
        
                  if(isErrorPassword) {
                    return;
                  }

                  if(formKey.currentState!.validate()) {
                    Provider.of<UserProvider>(context, listen: false).updatePassword(newPasswordController.text);
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Password has been successfully updated",
                          style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.blue,
                      )
                    );
                  }
                } : null, 
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: !isCurrentPasswordEmpty && !isCurrentPasswordEmpty && !isConfirmPasswordEmpty ? Colors.blue : Theme.of(context).colorScheme.secondary,
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
      ),
    );
  }
}
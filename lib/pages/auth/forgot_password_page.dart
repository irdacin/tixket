import 'package:flutter/material.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/pages/auth/verification_page.dart';
import 'package:tixket/utils/validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  bool isErrorTextEmail = false;
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            icon: const Icon(Icons.close)
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  "Please enter your email to reset your password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 40),
                InputField(
                  controller: emailController,
                  labelText: "Email",
                  focusNode: focusNodeEmail,
                  icon: Icons.email,
                  errorText: isErrorTextEmail ? "This email has never been registered" : null,
                ),
                const SizedBox(height: 20),
                LoadingButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      setState(() {
                        if(Validator().validateEmailSignUp(emailController.text)) {
                            isErrorTextEmail = false;
                        } else {
                            isErrorTextEmail = true;
                        }
                      });
            
                      if(isErrorTextEmail) {
                        return;
                      }
            
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => VerificationPage(email: emailController.text))
                      );
                    }
                  }, 
                  label: "Send"
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
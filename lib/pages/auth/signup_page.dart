import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/models/user_model.dart';
import 'package:tixket/pages/auth/login_page.dart';
import 'package:tixket/pages/index_page.dart';
import 'package:tixket/providers/theme_provider.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode focusNodeUsername = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();

  final formKey = GlobalKey<FormState>();
  
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isErrorTextUsername = false;
  bool isErrorTextEmail = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme(!isDarkMode);
                  }, 
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  label: Text(
                    "Switch to ${isDarkMode ? 'Light Mode': 'Dark Mode'}",
                    style: Theme.of(context).textTheme.bodyLarge
                  )
                ),
                const Text(
                  "Tixket",
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 50),
                InputField(
                  controller: usernameController,
                  labelText: "Username",
                  focusNode: focusNodeUsername,
                  icon: Icons.person,
                  validator: (value) => Validator().validateUsername(value),
                  errorText: isErrorTextUsername ? "Username already exists" : null,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: emailController,
                  labelText: "Email",
                  focusNode: focusNodeEmail,
                  icon: Icons.email,
                  validator: (value) => Validator().validateEmail(value),
                  errorText: isErrorTextEmail ? "Email already exists" : null,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: passwordController,
                  labelText: "Password",
                  focusNode: focusNodePassword,
                  icon: Icons.lock,
                  isVisible: isPasswordVisible,
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible ^= true;
                      });
                    },
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  validator: (value) => Validator().validatePassword(value),
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
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
                Text(
                  "Or Sign Up With",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){}, 
                      child: Image.asset(
                        "assets/images/facebook.png",
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 50),
                    InkWell(
                      onTap: (){}, 
                      child: Image.asset(
                        "assets/images/google.png",
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                LoadingButton(
                  label: "Sign Up",
                  onPressed: () {
                    setState(() {
                      isErrorTextUsername = Validator().validateUsernameSignUp(usernameController.text);
                      isErrorTextEmail = Validator().validateEmailSignUp(emailController.text);
                    });

                    if(isErrorTextUsername || isErrorTextEmail) {
                      return;
                    }

                    if(formKey.currentState!.validate()) {
                      User user = User(
                        username: usernameController.text,
                        password: passwordController.text,
                        email: emailController.text
                      );

                      Provider.of<UserProvider>(context, listen: false).addUser(user);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const IndexPage())
                      );
                    }
                  }
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        textStyle: Theme.of(context).textTheme.bodyMedium
                      ),
                      child: const Text("Login"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
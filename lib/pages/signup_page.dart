import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/data/user.dart';
import 'package:tixket/pages/home_page.dart';
import 'package:tixket/pages/login_page.dart';
import 'package:tixket/provider/theme_provider.dart';
import 'package:tixket/provider/user_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode focusNodeUsername = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();

  final formKey = GlobalKey<FormState>();
  
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isErrorTextUsername = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: (){
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  }, 
                  icon: Icon(
                    Provider.of<ThemeProvider>(context).isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  label: Text(
                    "Switch to ${Provider.of<ThemeProvider>(context).isDarkMode ? 'Light Mode': 'Dark Mode'}",
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
                  validator: (value) => UserProvider().validateUsername(value),
                  errorText: isErrorTextUsername ? "Username already exists" : null,
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
                  validator: (value) => UserProvider().validatePassword(value),
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
                  validator: (value) => UserProvider().validateConfirmPassword(value, passwordController.text),
                ),
                const SizedBox(height: 80),
                const Text(
                  "Or Sign Up With",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff858484)
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){}, 
                      child: Image.asset(
                        "assets/facebook.png",
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: (){}, 
                      child: Image.asset(
                        "assets/google.png",
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                LoadingButton(
                  label: "Sign Up",
                  onPressed: () {
                    if(UserProvider().validateUserSignUp(usernameController.text)) {
                      setState(() {
                        isErrorTextUsername = true;
                      });
                      return;
                    } else {
                      setState(() {
                        isErrorTextUsername = false;
                      });
                    }

                    if(formKey.currentState!.validate()) {
                      User user = User(
                        username: usernameController.text,
                        password: passwordController.text
                      );

                      Provider.of<UserProvider>(context, listen: false).addUser(user);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const HomePage())
                      );
                    }
                  }
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff858484)
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          fontSize: 16
                        )
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
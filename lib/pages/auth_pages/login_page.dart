import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/data/user.dart';
import 'package:tixket/pages/auth_pages/forgot_password_page.dart';
import 'package:tixket/pages/auth_pages/signup_page.dart';
import 'package:tixket/providers/theme_provider.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/home.dart';
import 'package:tixket/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode focusNodeUsername = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  final formKey = GlobalKey<FormState>();
  
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isErrorText = false;

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
                  onPressed: (){
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
                  errorText: isErrorText ? "Wrong Username or Password" : null,
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
                  errorText: isErrorText ? "Wrong Username or Password" : null,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ForgotPasswordPage())
                      );
                    }, 
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyMedium
                    )
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Or Log in With",
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
                  label: "Log in",
                  onPressed: () {
                    if(Validator().validateUserLogin(usernameController.text, passwordController.text)) {
                      setState(() {
                        isErrorText = true;
                      });
                      return;
                    } else {
                      setState(() {
                        isErrorText = false;
                      });
                    }

                    if(formKey.currentState!.validate()) {
                      User user = User(
                        username: usernameController.text,
                        password: passwordController.text
                      );

                      Provider.of<UserProvider>(context, listen: false).setUser(user);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Home())
                      );
                    }
                  }
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const SignUpPage())
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        textStyle: Theme.of(context).textTheme.bodyMedium
                      ),
                      child: const Text("Sign up"),
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
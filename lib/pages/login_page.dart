import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/data/user.dart';
import 'package:tixket/pages/signup_page.dart';
import 'package:tixket/providers/theme_provider.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/home.dart';

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
                  validator: (value) => UserProvider().validatePassword(value),
                  errorText: isErrorText ? "Wrong Username or Password" : null,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){}, 
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.displayMedium
                    )
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Or Log in With",
                  style: Theme.of(context).textTheme.displayMedium
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
                    if(UserProvider().validateUserLogin(usernameController.text, passwordController.text)) {
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
                      style: Theme.of(context).textTheme.displayMedium
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
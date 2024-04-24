import 'package:flutter/material.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/pages/login_page.dart';
import 'package:tixket/provider/setting_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.dark_mode),
                  label: Text("Switch to Dark Mode")
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
                  hintText: "Username",
                  icon: Icons.person,
                  validator: (value) => SettingsProvider().validator(value, "Username is required"),
                ),
                SizedBox(height: 20),
                InputField(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.person,
                  isVisible: false,
                  validator: (value) => SettingsProvider().validator(value, "Username is required"),
                ),
                SizedBox(height: 20),
                InputField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.person,
                  isVisible: false,
                  validator: (value) => SettingsProvider().validator(value, "Username is required"),
                ),
                SizedBox(height: 80),
                Text("Or Sign Up With"),
                SizedBox(height: 50),
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
                    SizedBox(width: 30),
                    TextButton(
                      onPressed: (){}, 
                      child: Image.asset(
                        "assets/google.png",
                        height: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){

                    } else {
                      
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text("Sign Up"),
                ),
                Row(
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/pages/home_page.dart';
import 'package:tixket/pages/login_page.dart';
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

  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
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
                  validator: (value) => Provider.of<UserProvider>(context).validator(value, "Username is required"),
                ),
                SizedBox(height: 20),
                InputField(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  isVisible: !isPasswordVisible,
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible ^= true;
                      });
                    },
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  validator: (value) => Provider.of<UserProvider>(context).validator(value, "Password is required"),
                ),
                SizedBox(height: 20),
                InputField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  isVisible: !isConfirmPasswordVisible,
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible ^= true;
                      });
                    },
                    icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  validator: (value) => Provider.of<UserProvider>(context).validator(value, "Confirm is required"),
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
                    if(passwordController.text != confirmPasswordController.text) {
                      
                      return;
                    }
                    if(formKey.currentState!.validate()){
                      User user = User(
                        username: usernameController.text,
                        password: passwordController.text
                      );

                      Provider.of<UserProvider>(context, listen: false).addUser(user);
                      Provider.of<UserProvider>(context, listen: false).setUser(user);

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())
                      );
                    } else {

                    }
                    
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 0),
                    foregroundColor: const Color.fromARGB(255, 36, 16, 16),
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text("Sign Up"),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
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
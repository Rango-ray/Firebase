import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loggin_page/screen/create_page.dart';
import 'package:loggin_page/screen/homepage.dart';
import 'package:loggin_page/screen/forgot_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailTextLoginController =
      TextEditingController();
  final TextEditingController _passwordTextLoginController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 82, 82),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 250, 242, 249),
            Color.fromARGB(221, 0, 0, 0)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.of(context).size.height * 0.1,
            20,
            0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailTextLoginController,
                enableSuggestions: false,
                autocorrect: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'Email',
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: const Color.fromARGB(200, 233, 226, 233),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _passwordTextLoginController,
                obscureText: true,
                autocorrect: true,
                enableSuggestions: false,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 61, 2, 40),
                  ),
                  labelText: 'Password',
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: const Color.fromARGB(200, 233, 226, 233),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextLoginController.text,
                              password: _passwordTextLoginController.text)
                          .then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ).onError(
                        (error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                              
                              backgroundColor: Colors.yellowAccent,
                              dismissDirection: DismissDirection.up,
                              duration: const Duration(seconds: 7),
                              content: const Text(
                                "       📛Wrong Email or Password📛",
                                style: TextStyle(
                                   
                                    backgroundColor: Colors.yellowAccent,
                                    color: Colors.red,
                                    fontSize: 30),
                              ),
                                padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, // Inner padding for SnackBar content.
                             ) 

                             
                          ),);
                        },
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blue;
                          }
                          return Colors.yellow;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    child: const Text(
                      "SignIn",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Perform sign-in logic here
                  

              //   },
              //   child: const Text(
              //     'Sign In',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Sign Up ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                      
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPage()),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style:
                          TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                          ),
                          
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

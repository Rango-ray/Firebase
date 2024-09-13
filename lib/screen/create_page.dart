import 'package:flutter/material.dart';
import 'package:loggin_page/screen/forgot_page.dart';
import 'package:loggin_page/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sigin Up Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 82, 82),
      ),
      //appbar

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 234, 248, 231),
            Color.fromARGB(255, 0, 0, 0)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                enableSuggestions: false,
                controller: _emailTextController,
                autocorrect: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'Enter your Email',
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
                height: 20,
              ),

              //usernamee...
              TextField(
                obscureText: true,
                controller: _userNameTextController,
                enableSuggestions: false,
                autocorrect: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  labelText: 'Enter Username',
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
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                controller: _passwordTextController,
                autocorrect: true,
                enableSuggestions: false,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 61, 2, 40),
                  ),
                  labelText: ' Your Password',
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
              // ElevatedButton(
              //   onPressed: () {
              //     // Perform sign-in logic here
              //   },
              //   child: const Text('Sign In' ,
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,

              //   ),),
              // ),

                            Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then(
                      (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ).onError(
                      (error, stackTrace) {
                        var invalidemailError =
                            "[firebase_auth/invalid-email] The email address is badly formatted.";
                        var emailExistError =
                            "[firebase_auth/email-already-in-use] The email address is already in use by another account.";
                        var weakPassword =
                            "[firebase_auth/weak-password] Password should be at least 6 characters";
                        print(error);
                        if (error.toString() == invalidemailError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 15, 79, 255),
                              dismissDirection: DismissDirection.up,
                              duration: Duration(seconds: 7),
                              content: Text(
                                "Invalid Email",
                                style: TextStyle(
                                    backgroundColor: Color.fromARGB(255, 15, 79, 255),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 30),
                              ),
                            ),
                          );
                        } else if (error.toString() == emailExistError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 15, 79, 255),
                              dismissDirection: DismissDirection.up,
                              duration: Duration(seconds: 7),
                              content: Text(
                                "Email Address Already Exist",
                                style: TextStyle(
                                    backgroundColor: Color.fromARGB(255, 15, 79, 255),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 30),
                              ),
                            ),
                          );
                        }
                        else if(error.toString() == weakPassword){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 15, 79, 255),
                              dismissDirection: DismissDirection.up,
                              duration: Duration(seconds: 7),
                              content: Text(
                                "Weak Password Plz Enter at least 6 characters",
                                style: TextStyle(
                                    backgroundColor: Color.fromARGB(255, 15, 79, 255),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 30),
                              ),
                            ),
                          );
                        }
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
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
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255,),
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

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loggin_page/screen/create_page.dart';
import 'login_page.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<ForgotPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sign Up Page'),
        backgroundColor: CupertinoColors.systemGrey,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CupertinoColors.lightBackgroundGray,
              CupertinoColors.black,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoTextField(
                controller: _emailTextController,
                placeholder: 'Enter your Email',
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.mail_solid),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: _userNameTextController,
                placeholder: 'Enter Username',
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.person_solid),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              const SizedBox(height: 15),
              CupertinoTextField(
                controller: _passwordTextController,
                placeholder: 'Your Password',
                obscureText: true,
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.lock),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: CupertinoButton.filled(
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text,
                        )
                        .then((value) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      var invalidemailError =
                          "[firebase_auth/invalid-email] The email address is badly formatted.";
                      var emailExistError =
                          "[firebase_auth/email-already-in-use] The email address is already in use by another account.";
                      var weakPassword =
                          "[firebase_auth/weak-password] Password should be at least 6 characters";
                      if (error.toString() == invalidemailError) {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Error'),
                            content: const Text('Invalid Email'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      } else if (error.toString() == emailExistError) {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Error'),
                            content: const Text('Email Address Already Exists'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      } else if (error.toString() == weakPassword) {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'Weak Password. Please enter at least 6 characters.'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: CupertinoColors.white,
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

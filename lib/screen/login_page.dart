import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loggin_page/screen/create_page.dart';
import 'package:loggin_page/shoees_pages/homepage.dart';
import 'package:loggin_page/screen/forgot_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailTextLoginController =
      TextEditingController();
  final TextEditingController _passwordTextLoginController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Login Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 80, 82, 82),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 250, 242, 249),
              Color.fromARGB(221, 0, 0, 0),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
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
              CupertinoTextField(
                controller: _emailTextLoginController,
                placeholder: 'Email',
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.mail),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 233, 226, 233),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              CupertinoTextField(
                controller: _passwordTextLoginController,
                placeholder: 'Password',
                obscureText: true,
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.lock),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(200, 233, 226, 233),
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
                        .signInWithEmailAndPassword(
                            email: _emailTextLoginController.text,
                            password: _passwordTextLoginController.text)
                        .then((value) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: const Text("Error"),
                          content: const Text("Wrong Email or Password"),
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
                    });
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20),
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
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ForgotPage(),
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

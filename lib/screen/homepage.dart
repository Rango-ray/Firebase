import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {   
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
        title: const Text(
          'Congratulation your now In',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 82, 82),
      ),
        body: 
        const Center(
          child: Text("Your Login",
          style: TextStyle(fontSize: 28),),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:photo_gallery/Screens/photo_gallery_main_screen.dart';
import 'package:photo_gallery/Screens/signup.dart';

class MyLoginApp extends StatelessWidget {
  const MyLoginApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();

String login = 'clyntriley';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
               Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: userName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: passWord,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );


                  },
                  child: const Text('Login'),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySignupApp()),
                  );

                  },
                child: const Text('Sign-up'),
              ),






            ],
          )
      )





    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/View/photo_gallery_main_screen.dart';
import 'package:photo_gallery/services/cloud_storage.dart';

class MySignupApp extends StatelessWidget {
  const MySignupApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MySignupPage(title: 'Sign-up'),
    );
  }
}

class MySignupPage extends StatefulWidget {
  const MySignupPage({Key? key, required this.title}) : super(key: key);

  final String title;




  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {

  static Future<User?> createUserUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController passWord = TextEditingController();
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sign-up',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                 Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
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

                ElevatedButton(
                  onPressed: () async {
                    User? user = await createUserUsingEmailPassword(email: email.text, password: passWord.text, context: context);
                    print(user);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
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
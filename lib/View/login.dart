import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/View/photo_gallery_main_screen.dart';
import 'package:photo_gallery/View/signup.dart';


class MyLoginApp extends StatelessWidget {
  const MyLoginApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyLoginPage(),
    );
  }
}
class LoginScreen extends StatefulWidget  {
  const LoginScreen({Key? key, }) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyLoginScreenState();
}

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseapp = await Firebase.initializeApp();
  return firebaseapp;
}
class _MyLoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return  const MyLoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

}



class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key, }) : super(key: key);


  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {


  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e){
    if (e.code == "User not Found") {
      print('No User found for that email');
    }
  }
  return user;
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController passWord = TextEditingController();
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
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(email: userName.text, password: passWord.text, context: context);
                    print(user);
                    if(user != null ){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    }
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


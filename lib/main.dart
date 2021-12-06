
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messageme/screens/chatScreen.dart';
import 'package:messageme/screens/registrationScreen.dart';
import 'package:messageme/screens/signinScreen.dart';
import 'package:messageme/screens/welcomeScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  home:ChatScreen(),
      initialRoute:_auth.currentUser!= null?
      ChatScreen.screenRoute:
      WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute:(context) => WelcomeScreen(),
        SignInScreen.screenRoute:(context) => SignInScreen(),
        RegistrationScreen.screenRoute:(context) => RegistrationScreen(),
        ChatScreen.screenRoute:(context) => ChatScreen(),
      },
    );
  }
}

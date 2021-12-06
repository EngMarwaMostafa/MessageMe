
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messageme/widgets/MyButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chatScreen.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'signin_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  late String email,password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(height: 50,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value){
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide:BorderSide(
                      color: Colors.orange,
                      width: 1,),
                    borderRadius:BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide:BorderSide(
                        color: Colors.blue,
                        width: 2),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value){
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide:BorderSide(
                      color: Colors.orange,
                      width: 1,),
                    borderRadius:BorderRadius.all(Radius.circular(10),
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide:BorderSide(
                        color: Colors.blue,
                        width: 2),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              MyButton(color: Colors.yellow[900]!,
                title: 'Sign in',
                onPressed: () async{
                  final user = _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  setState(() {
                    showSpinner= true;
                  });
                  try{
                    final user = _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if(user != null){
                      Navigator.pushNamed(context, ChatScreen.screenRoute);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  }catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

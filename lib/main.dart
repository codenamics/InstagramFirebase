import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  Widget _getScreenRouteName(){
    return StreamBuilder<FirebaseUser>(stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, snapshot){
      if(snapshot.hasData){
        return HomeScreen();
      }else{
        return LoginScreen();
      }
    },
    
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      
      home: _getScreenRouteName(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        FeedScreen.routeName: (ctx) => FeedScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  static final String routeName = 'feed-screen';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(context),
          child: Text('Logout'),
          color: Colors.blue,
        ),
      ),
    );
  }
}

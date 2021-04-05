import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth})
      : super(key: key);

  final AuthBase auth;

  Future<void> _signInGuest() async {
    try {
      await auth.signInGuest();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer() {
    return Padding(
      //color: Colors.yellow,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 32.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: "Sign in with Google",
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: "Sign in with facebook",
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Sign in with Email",
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text('or',
              style: TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Guest",
            textColor: Colors.black87,
            color: Colors.yellowAccent,
            onPressed: _signInGuest,
          )
        ],
      ),
    );
  }
}

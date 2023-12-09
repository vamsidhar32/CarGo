import 'dart:convert';

import 'package:auto/forget_password.dart';
import 'package:auto/pages/seller/sellerHome.dart';
import 'package:auto/pages/home/home.dart';
import 'package:auto/pages/registration_page.dart';
import 'package:auto/pages/userType.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  late final TextEditingController email;
  late final TextEditingController password;
  Stream? dataList;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 50.h,
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 50.h,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                login(
                    email: email.text.toString(),
                    password: password.text.toString());
                print("login");
              },
              child: Container(
                alignment: Alignment.center,
                width: 150.w,
                height: 45.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Get.to(ForgetPassword());
              },
              child: Container(
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Get.to(RegistrationPage());
              },
              child: Container(
                child: Text(
                  "Don't have account? Click",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),

            ElevatedButton(
                onPressed: signInWithGoogle,
                child: Text('Sign in with Google'),
            ),

            ElevatedButton(
                onPressed: signInWithFacebook,
                child: Text('Sign in with Facebook'),
            ),
          ],

        ),
      ),
    );
    // Inside your build method

     //Add these buttons where you want them in your UI
     
            ElevatedButton(
                onPressed: signInWithGoogle,
                child: Text('Sign in with Google'),
            );

            ElevatedButton(
                onPressed: signInWithFacebook,
                child: Text('Sign in with Facebook'),
            );
  }

  var uId;
  login({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = userCredential.user;
    var token = user!.getIdToken();

    await user.reload();

    if (user.emailVerified == true) {
      // User is verified, continue with your app logic
      try {
        var uId = user.uid;
        if (uId != null) {
          Get.to(Home(
            user: user,
          ));
        }

        //   userList = querySnapshot.docs.map((e) => kako.User.fromMap(e.data())).toList();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Get.snackbar("Email", "No user found for that email");
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided.');
          Get.snackbar("Password", "Wrong password provided.");
        }
      }
    } else {
      print(user);
      Get.snackbar('Email not verified',
          'Check your email and click the link to activate your account',
          snackPosition: SnackPosition.BOTTOM);
    }

    return user;
  }

  // Inside your _LoginPageState class

// Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final OAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(googleAuthCredential);

        final User? user = userCredential.user;

        if (user != null) {
          // Successfully signed in with Google
          print('Google Sign-In Successful: ${user.displayName}');
          // Navigate to your desired screen
          Get.to(Home(user: user));
        }
      }
    } catch (e) {
      print('Google Sign-In Error: $e');
    }
  }

// Facebook Sign-In
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult =
          await FacebookAuth.instance.login(permissions: ['email']);

      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        final User? user = userCredential.user;

        if (user != null) {
          // Successfully signed in with Facebook
          print('Facebook Sign-In Successful: ${user.displayName}');
          // Navigate to your desired screen
          Get.to(Home(user: user));
        }
      }
    } catch (e) {
      print('Facebook Sign-In Error: $e');
    }
  }
}

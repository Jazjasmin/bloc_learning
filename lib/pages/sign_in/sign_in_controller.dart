import 'package:bloc_leaning_pjct/common/values/constant.dart';
import 'package:bloc_leaning_pjct/common/widgets/flutter_toaster.dart';
import 'package:bloc_leaning_pjct/pages/global.dart';
import 'package:bloc_leaning_pjct/pages/sign_in/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SigninBloc>(context).state
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to varity your email account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            print("User exit");
            Global.storageService.setString((AppConstants.STORAGE_USER_PROFILE_KEY), "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
            //we got varified user from firebase
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
            // we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}

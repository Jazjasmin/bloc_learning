import 'package:bloc_leaning_pjct/pages/common_widget.dart';
import 'package:bloc_leaning_pjct/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../sign_in/widgets/sign_in_widget.dart';
import 'bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: reusableText(
                            "Enter your details below and free sign up")),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          buildTextField("Enter your user name", "name", "user",
                              (value) {
                            context.read<RegisterBloc>().add(UserNameEvent(value));
                          }),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText("Confirm Password"),
                          buildTextField(
                              "Enter your confirm password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: reusableText(
                            "Enter your details below and free sign up")),
                    buildLogInAndRegButton("Sign Up", "login", () {
                      //Navigator.of(context).pushNamed("register");
                      RegisterController(context: context).handleEmailRegister();
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

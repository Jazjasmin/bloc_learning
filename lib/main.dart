import 'package:bloc_leaning_pjct/common/routes/pages.dart';
import 'package:bloc_leaning_pjct/common/values/colors.dart';
import 'package:bloc_leaning_pjct/pages/application/application_page.dart';
import 'package:bloc_leaning_pjct/pages/bloc_providers.dart';
import 'package:bloc_leaning_pjct/pages/global.dart';
import 'package:bloc_leaning_pjct/pages/register/register.dart';
import 'package:bloc_leaning_pjct/pages/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_leaning_pjct/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
 await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: AppColors.primaryText,
            ),
            backgroundColor: Colors.white,
          )),
          //home: const Welcome(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // routes: {
          //   "signIn": (context) => const SignIn(),
          //   "register":(context) => const Register()
          // },
        ),
      ),
    );
  }
}



import 'package:bloc_leaning_pjct/common/routes/names.dart';
import 'package:bloc_leaning_pjct/pages/application/application_page.dart';
import 'package:bloc_leaning_pjct/pages/application/bloc/app_bloc.dart';
import 'package:bloc_leaning_pjct/pages/global.dart';
import 'package:bloc_leaning_pjct/pages/home/bloc/home_page_bloc.dart';
import 'package:bloc_leaning_pjct/pages/home/home_page.dart';
import 'package:bloc_leaning_pjct/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:bloc_leaning_pjct/pages/profile/settings/settings_page.dart';
import 'package:bloc_leaning_pjct/pages/register/bloc/register_bloc.dart';
import 'package:bloc_leaning_pjct/pages/register/register.dart';
import 'package:bloc_leaning_pjct/pages/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_leaning_pjct/pages/sign_in/sign_in.dart';
import 'package:bloc_leaning_pjct/pages/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_leaning_pjct/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          ),
          page: const Welcome(),
          route: AppRoutes.INITIAL),
      PageEntity(
          bloc: BlocProvider(
            create: (_) => SigninBloc(),
          ),
          page: const SignIn(),
          route: AppRoutes.SIGN_IN),
      PageEntity(
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          ),
          page: const Register(),
          route: AppRoutes.REGISTER),
      PageEntity(
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          ),
          page: const ApplicationPage(),
          route: AppRoutes.APPLICATION),
      PageEntity(
          bloc: BlocProvider(
            create: (_) => HomePageBloc(),
          ),
          page: const HomePage(),
          route: AppRoutes.HOME_PAGE),
      PageEntity(
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          ),
          page: const SettingsPage(),
          route: AppRoutes.SETTINGS)
      
    ];
  }

//return all the blocprovider
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

//a model that covers entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("first log");
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn) {
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          print("second log");
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        print("valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify Blocprovider and routes and pages

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({this.bloc, required this.page, required this.route});
}

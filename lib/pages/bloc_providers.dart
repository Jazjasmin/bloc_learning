import 'package:bloc_leaning_pjct/pages/register/bloc/register_bloc.dart';
import 'package:bloc_leaning_pjct/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in/bloc/signin_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders => [
     BlocProvider(lazy: true,create: (context) => WelcomeBloc()),
     BlocProvider(create: (context) => SigninBloc()),
     BlocProvider(create: (context) => RegisterBloc(),)
  ];
}
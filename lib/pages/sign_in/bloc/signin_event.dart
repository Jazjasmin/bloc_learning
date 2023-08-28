part of 'signin_bloc.dart';

abstract class SigninEvent {
  const SigninEvent();
}

class EmailEvent extends SigninEvent{
  final String email;
  EmailEvent(this.email);
  
}
class PasswordEvent extends SigninEvent{
  final String password;
  PasswordEvent(this.password);
  
}

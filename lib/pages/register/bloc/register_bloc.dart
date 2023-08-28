import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);  
 }

 void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit){
  print("${event.userName.toString()}");
   emit(state.copyWith(userName: event.userName));
 }
 void _emailEvent(EmailEvent event, Emitter<RegisterState> emit){
  print("${event.email.toString()}");
   emit(state.copyWith(userName: event.email));
 }
 void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit){
  print("${event.password.toString()}");
   emit(state.copyWith(userName: event.password));
 }
 void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit){
  print("${event.rePassword.toString()}");
   emit(state.copyWith(userName: event.rePassword));
 }

}


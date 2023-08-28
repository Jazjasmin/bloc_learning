import 'package:bloc/bloc.dart';
import 'package:bloc_leaning_pjct/pages/sign_in/bloc/signin_state.dart';
import 'package:meta/meta.dart';
part 'signin_event.dart';


class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninState()) {
    on<EmailEvent>(_emailEvent);

     on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    print("my email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    print("my email is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
  
}

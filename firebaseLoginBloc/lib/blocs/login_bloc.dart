import 'package:firebaseLoginBloc/events/login_event.dart';
import 'package:firebaseLoginBloc/repositories/user_repository.dart';
import 'package:firebaseLoginBloc/states/login_state.dart';
import 'package:firebaseLoginBloc/validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../user_model.dart';
// kieu du lieu loginevent và loginstate

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  //constructor
  LoginBloc({@required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository,
  // khởi tạo

      super(LoginState.initial());
  //Give 2 adjacent events a "debounce time"
  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> loginEvents,
      TransitionFunction<LoginEvent, LoginState> transitionFunction,
      ) {
    // tham gia vao qua trinh tre
    final debounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is LoginEventEmailChanged || loginEvent is LoginEventPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));//minimum 300ms for each event

    // nhung thang k ap dung do tre cua hai laAN bam lien tiep

    final nonDebounceStream = loginEvents.where((loginEvent) {
        return (loginEvent is! LoginEventEmailChanged && loginEvent is! LoginEventPasswordChanged);
    });
    return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]), transitionFunction);
  }
  // mapEventToState tuỳ thuộc vào các event

  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async*{
    final loginState = state;//for easier to read code purpose !
    if(loginEvent is LoginEventEmailChanged) {
      yield loginState.cloneAndUpdate(isValidEmail: Validators.isValidEmail(loginEvent.email));
    } else if(loginEvent is LoginEventPasswordChanged) {
      yield loginState.cloneAndUpdate(isValidPassword: Validators.isValidPassword(loginEvent.password));
    } else if(loginEvent is LoginEventWithGooglePressed) {
      try {
       // await _userRepository.signInWithEmailAndPassword();
        yield LoginState.success();
      }catch(exception) {
        yield LoginState.failure();
      }
    } else if(loginEvent is LoginEventWithEmailAndPasswordPressed) {
      try {
        UserModel gdgfg= await _userRepository.signInWithEmailAndPassword(loginEvent.email, loginEvent.password);
      //  if (gdgfg.key != null) {
        yield LoginState.success();
          yield state.success1(

              code: gdgfg.code,
          state: gdgfg.success

          );
          Future.delayed(Duration(microseconds: 300));
        //  yield state.bookParty(status: FormzStatus.pure);
        //}
       // yield LoginState.success();
      }catch(_) {
        yield LoginState.failure();
      }
    }
  }
}
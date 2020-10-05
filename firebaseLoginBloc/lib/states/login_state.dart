import 'package:firebaseLoginBloc/user_model.dart';
import 'package:meta/meta.dart';
//immutatble là k thay đổi trực tiếp
//mà có các state
@immutable
class LoginState {
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get isValidEmailAndPassword => isValidEmail && isValidPassword;
  final int code;


  //////

  final bool state;

  //final List<UserModel> user;
  //do the same with RegisterState
  //constructor
  LoginState({
    @required this.isValidEmail,
    @required this.isValidPassword,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.code,
    @required this.state,
  });
  //each state is an object, or static object,
  //Can be create by using static/factory method
  factory LoginState.initial() {
    return LoginState(
      isValidEmail: true,
      isValidPassword: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      code: 0
    );
  }
  //Loading state ?
  factory LoginState.loading() {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        code: 0
    );
  }
  //Failure state ?
  factory LoginState.failure() {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        code: 0
    );
  }
  //Success state ?
  factory LoginState.success() {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,

    );
  }



//
//  factory LoginState.success1(int code) {
//    return LoginState(
//        isValidEmail: true,
//        isValidPassword: true,
//        isSubmitting: false,
//        isSuccess: true,
//        isFailure: false,
//        code: code
//    );
//  }
  LoginState success1({int code, bool state}) {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        code: code,
      state: state
    );
  }

  //Clone an object of LoginState?
  LoginState cloneWith({
    bool isValidEmail,
    bool isValidPassword,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure
  }){
    return LoginState(
        isValidEmail: isValidEmail ?? this.isValidPassword, //if isValidEmail == null => isValidEmail unchanged !
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isSubmitting: isSubmitting ?? this.isSuccess,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure
    );
  }
  //How to clone an object and update that object ?
  LoginState cloneAndUpdate({
    bool isValidEmail,
    bool isValidPassword
  }) {
    return cloneWith(
      isValidEmail: isValidEmail,
      isValidPassword: isValidPassword,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }
}
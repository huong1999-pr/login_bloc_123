import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
// lưu trữ các state của ứng dụng
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  // TODO: implement props
  //de xac dinh trang thai khac nhau thi can cu vao cai j

  List<Object> get props => [];
}
class AuthenticationStateInitial extends AuthenticationState {}
// trạng thái thành công
class AuthenticationStateSuccess extends AuthenticationState {
  final FirebaseUser firebaseUser;
  const AuthenticationStateSuccess({this.firebaseUser});
  @override
  // TODO: implement props
  List<Object> get props => [firebaseUser];
  @override
  String toString() => 'AuthenticationStateSuccess, email: ${firebaseUser.email}';
}
// trang thai chua dang nhap

class AuthenticationStateFailure extends AuthenticationState {}
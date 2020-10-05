import 'package:firebaseLoginBloc/events/authentication_event.dart';
import 'package:firebaseLoginBloc/repositories/user_repository.dart';
import 'package:firebaseLoginBloc/states/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
// mỗi thực thể có một bloc riêng để quản lí tập hợp state tưuơng ứng
//
// là nơi cho biết sự thay đổi giữa state cũ và state mới ra sao khi mà có event tác động vào
// event tác động thì sinh ra state thay đôit


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  //constructor
  AuthenticationBloc({@required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository,
      super(AuthenticationStateInitial()); //initial state

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent authenticationEvent) async*{
    // kiem tra dk dau vao

//    if(authenticationEvent is AuthenticationEventStarted) {
//      final isSignedIn = await _userRepository.isSignedIn();
//      if(isSignedIn) {
//        final firebaseUser = await _userRepository.getUser();
//        yield AuthenticationStateSuccess(firebaseUser: firebaseUser);
//      } else {
//        yield AuthenticationStateFailure();
//      }
//    } else if(authenticationEvent is AuthenticationEventLoggedIn) {
//      yield AuthenticationStateSuccess(firebaseUser: await _userRepository.getUser());
//    } else if(authenticationEvent is AuthenticationEventLoggedOut) {
//      _userRepository.signOut();
//      yield AuthenticationStateFailure();
//    }
  }
}
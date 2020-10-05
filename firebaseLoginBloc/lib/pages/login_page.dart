import 'package:firebaseLoginBloc/blocs/authentication_bloc.dart';
import 'package:firebaseLoginBloc/blocs/login_bloc.dart';
import 'package:firebaseLoginBloc/events/authentication_event.dart';
import 'package:firebaseLoginBloc/events/login_event.dart';
import 'package:firebaseLoginBloc/pages/buttons/google_login_button.dart';
import 'package:firebaseLoginBloc/pages/buttons/login_button.dart';
import 'package:firebaseLoginBloc/pages/buttons/register_user_button.dart';
import 'package:firebaseLoginBloc/repositories/user_repository.dart';
import 'package:firebaseLoginBloc/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../user_model.dart';
import 'huong.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;
  // tao class ke thua tu state, stateful???
  //constructor

  LoginPage({Key key, @required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository,

  // key la thuoc tinh mac dinh cua mot components

      super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  UserModel _user;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo;
//  final userRepositxory = UserRepository();
  fetchDeviceInfo() async {
    androidInfo = await deviceInfo.androidInfo;
    setState(() {

    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // doi tuong loginbloc chi phuc vu rieng cho man hinh login
  //final UserModel user =
  //_LoginPageState.signInWithEmailAndPassword(String email, String password)  ;
  LoginBloc _loginBloc;
  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(() {
      //when email is changed,this function is called !
      _loginBloc.add(LoginEventEmailChanged(email: _emailController.text));
    });
    _passwordController.addListener(() {
      //when password is changed,this function is called !
      _loginBloc.add(LoginEventPasswordChanged(password: _passwordController.text));
    });
  }
  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState loginState) =>
      loginState.isValidEmailAndPassword & isPopulated && !loginState.isSubmitting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BlocBuilder bao ngoai, de lay duoc state
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState){
          if(loginState.isFailure) {
            print('Login failed');
          } else if(loginState.isSubmitting) {
            print('Logging in');
          } else if(loginState.isSuccess) {
            //add event: AuthenticationEventLoggedIn ?
      //  print(_user.code);
            print(loginState.code);
            print(loginState.state);
//            Navigator.pushReplacement(
//                context,
//                MaterialPageRoute(
//                    builder: (_) => Home(bill)));




            BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedIn());
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
//                  TextFormField(
//                    controller: _emailController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.email),
//                      labelText:  'Enter your email'
//                    ),
//                    keyboardType: TextInputType.emailAddress,
//                    autovalidate: true,
//                    autocorrect: false,
//                    validator: (_) {
//                      return loginState.isValidEmail ? null : 'Invalid email format';
//                    },
//                  ),
//                  TextFormField(
//                    controller: _passwordController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.lock),
//                      labelText: 'Enter password'
//                    ),
//                    obscureText: true,
//                    autovalidate: true,
//                    autocorrect: false,
//                    validator: (_){
//                      return loginState.isValidEmail ? null : 'Invalid password format';
//                    }),





                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        (androidInfo==null)?Center(
                          child: FlatButton(
                            color: Colors.pink,
                            child: Text("Device Info",style: TextStyle(
                                color: Colors.white,fontSize: 18
                            ),),
                            onPressed: (){
                              fetchDeviceInfo();
                            },
                          ),
                        ):Column(
                          children: <Widget>[
                            ListTile(
                              title: Text('Device Id: ${androidInfo.id}, '),
                            ), ListTile(
                              title: Text('Manufacturer: ${androidInfo.manufacturer}, '),
                            ),
                            ListTile(
                              title: Text('Product: ${androidInfo.product}, '),
                            ),
                            ListTile(
                              title: Text('Android Version: ${androidInfo.version.codename}, '),
                            ),
                          ],
                        ),


                        (androidInfo!=null)?  LoginButton(



                          onPressed:
                      //    isLoginButtonEnabled(loginState)?
                           _onLoginEmailAndPassword,
                              //: null, //check is enabled ?
//                          onPressed: () {
//                            _onLoginEmailAndPassword;
//
//                          },




//                          onPressed: (){
//                            isLoginButtonEnabled(loginState)? _onLoginEmailAndPassword : null;
//                            Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => Home()),
//                            );
//
//                          },



                        ): Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(''),
                            ), ListTile(
//                              title: Text('Manufacturer: ${androidInfo.manufacturer}, '),
//                            ),
//                            ListTile(
//                              title: Text('Product: ${androidInfo.product}, '),
//                            ),
//                            ListTile(
//                              title: Text('Android Version: ${androidInfo.version.codename}, '),
                             ),
                          ],
                        ),
//                        (androidInfo==null)?Center(
//                          child: FlatButton(
//                            color: Colors.pink,
//                            child: Text("Device Info",style: TextStyle(
//                                color: Colors.white,fontSize: 18
//                            ),),
//                            onPressed: (){
//                              fetchDeviceInfo();
//                            },
//                          ),
//                        ):Column(
//                          children: <Widget>[
//                            ListTile(
//                              title: Text('Device Id: ${androidInfo.id}, '),
//                            ), ListTile(
//                              title: Text('Manufacturer: ${androidInfo.manufacturer}, '),
//                            ),
//                            ListTile(
//                              title: Text('Product: ${androidInfo.product}, '),
//                            ),
//                            ListTile(
//                              title: Text('Android Version: ${androidInfo.version.codename}, '),
//                            ),
//                          ],
//                        ),

//                        Padding(padding: EdgeInsets.only(top: 10),),
//                        GoogleLoginButton(),
//                        Padding(padding: EdgeInsets.only(top: 10),),
//                        RegisterUserButton(userRepository: _userRepository,),
         //       final UserModel user = await userRepository: _userRepository,

                    //    _userRepository.signInWithEmailAndPassword(email, password) == null ? Container() :


                        _user == null ? Container() :
                        Text("The user ${_user.data.userInfo[0].id}, ${_user.code} is created successfully at time ${_user.code}"),





                      ],
                    ),// a login button here
                  ),
                  //Add "register" button here, to "navigate" to "Register Page"

                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void _onLoginEmailAndPassword() {
      _loginBloc.add(LoginEventWithEmailAndPasswordPressed(
      email: androidInfo.id,
      password: androidInfo.id
    ));
    //Failed because user does not exist
  }
}

















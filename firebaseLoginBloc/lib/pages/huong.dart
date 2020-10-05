import 'package:firebaseLoginBloc/blocs/authentication_bloc.dart';
import 'package:firebaseLoginBloc/events/authentication_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_model.dart';

class Home extends StatelessWidget {
  UserModel _user;
  Home(this._user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is HomePage'),
        actions: <Widget>[

        ],
      ),
      body: Center(
        child: Text("The user ${_user.code}, ${_user.code} is created successfully at time ${_user.code}"),
      ),
    );
  }
}
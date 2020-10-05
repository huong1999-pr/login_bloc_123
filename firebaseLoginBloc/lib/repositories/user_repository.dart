


// chua nhung ham thuc hien dang ki dang nhap

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../user_model.dart';

class UserRepository {



//
//  static final BASE_URL = "https://api.themoviedb.org/3/";
//
//  static UserRepository _instance = new UserRepository.internal();
//
//  UserRepository.internal();
//
//  factory UserRepository() => _instance;
//
//  final JsonDecoder _decoder = new JsonDecoder();










//
//  final FirebaseAuth _firebaseAuth;
//  final GoogleSignIn _googleSignIn;
  //constructor

//  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn}):
//      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
//      _googleSignIn = googleSignIn ?? GoogleSignIn(scopes: <String>[
//        'email',
//        'https://www.googleapis.com/auth/contacts.readonly',
//      ]);


  //tra ve ket qua khi sign in

//  Future<FirebaseUser> signInWithGoogle() async {
////    await _googleSignIn.signIn();
////    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
////    return firebaseUser;
//    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
//        idToken: googleSignInAuthentication.accessToken,
//        accessToken: googleSignInAuthentication.idToken
//    );
//    await _firebaseAuth.signInWithCredential(authCredential);
//    final currentUser = _firebaseAuth.currentUser();
//    return currentUser;
//  }

  //async chạy song song vs thang khac


//  Future<void> signInWithEmailAndPassword(String email, String password) async{
//    return await _firebaseAuth.signInWithEmailAndPassword(
//        email: email.trim(),
//        password: password
//    );
//  }



//  Future<dynamic> signInWithEmailAndPassword(String url,
//      String email, String password) {
//    return http
//        .post(url, email: email.trim(), password: password)
//        .then((http.Response response) {
//      String res = response.body;
//      int statusCode = response.statusCode;
//      print("API Response: " + res);
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        res = "{\"status\":" +
//            statusCode.toString() +
//            ",\"message\":\"error\",\"response\":" +
//            res +
//            "}";
//        throw new Exception( statusCode);
//      }
//      return _decoder.convert(res);
//    });
//  }
//
//
//  Future<dynamic> post(String url,
//      {Map<String, String> headers, body, encoding}) {
//    return http
//        .post(url, body: body, headers: headers, encoding: encoding)
//        .then((http.Response response) {
//      String res = response.body;
//      int statusCode = response.statusCode;
//      print("API Response: " + res);
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        res = "{\"status\":" +
//            statusCode.toString() +
//            ",\"message\":\"error\",\"response\":" +
//            res +
//            "}";
//        throw new Exception( statusCode);
//      }
//      return _decoder.convert(res);
//    });
//  }
//
//  Future<UserModel> signInWithEmailAndPassword(String email, String password) async {
//    UserModel _user;
//    final Map<String, dynamic> authData = {
//       "deviceId": email,
//      "platform": password,
//      "fToken": "fTokenAndroid1"
//    };
//
//     final http.Response response = await http.post("https://multichoise.pikatech.vn/api-apt/user/anonymousLogin",body: json.encode(authData)
//         //, headers: {"Content-Type": "application/json"}
//         );
//
//  //  final Response response = await post('postsURL', body: json.encode(authData), headers: {"Content-Type": "application/json"});
//
//
//
//
////    final Map<String, dynamic> authResponseData = json.decode(response.body);
//
////    if (response.statusCode == 400) {
////
////      //if (authResponseData.containsKey("error")) {
////        //if (authResponseData["error"] == "invalid_credentials") {
////
////      print('_someMethod: Foo Error } Error:{e.toString()}');
////       //   return {'success': false, 'message': 'Invalid User!'};
////
////        //}
////      //}
////
////    }
//
//    if (response.statusCode == 200) {
////      final String responseString = response.body;
////      print('_someMetring()}');
////      //return {'success': true, 'message': 'Successfuly login!'};
////      return _user(responseString);
//      final String responseString = response.body;
//
//      return userModelFromJson(responseString);
//
//
//    }
//
//  }



  Future<UserModel> signInWithEmailAndPassword(String email, String password) async{
    final String apiUrl = "https://multichoise.pikatech.vn/api-apt/user/anonymousLogin";
   UserModel _usermodel;

 // final String apiUrl = "https://multichoise.pikatech.vn/a";
    final response = await http.post(apiUrl, body: {
      "deviceId": email,
      "platform": password,
      "fToken": "fTokenAndroid1"
    });

    if(response.statusCode == 200){



      final String responseString = response.body;
     // print(response.body);
      return userModelFromJson(responseString);
    }else{
      return null;
    }
  }




//
//  Future<void> createUserWithEmailAndPassword(String email, String password) async {
//    return await _firebaseAuth.createUserWithEmailAndPassword(
//        email: email.trim(),
//        password: password);
//  }
//  Future<void> signOut() async {
//    return Future.wait([
//      _firebaseAuth.signOut(),
//      _googleSignIn.signOut()
//    ]);
//  }
//  Future<bool> isSignedIn() async {
//    return await _firebaseAuth.currentUser() != null;
//  }
//  Future<FirebaseUser> getUser() async {
//    return await _firebaseAuth.currentUser();
//  }
}
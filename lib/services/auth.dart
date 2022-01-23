import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //convert the firebase user into our custom one
  User? _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print (e.toString());
      return null;
    }
  }

  //sign in with email and pass

  //register with email and pass

  //sign out
}
import 'package:employee_db/models/user.dart';
import 'package:employee_db/screens/home/authenticate/first_page.dart';
import 'package:employee_db/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }


  // sign in anon
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user= result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(error){
      print(error.toString());
      return null;
    }

  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the ui
      await DatabaseService(uid: user.uid).updateUserData('new employee','example@gmail.com','employee department' , 0000000000,'employee state','role' );
      return _userFromFirebaseUser(user);
    } catch(error){
      print(error.toString());
      return null;
    }

  }


  // sign out
  Future signOut() async{
    try{
       await _auth.signOut();
      return OnboardingScreen();
    }catch(error){
      print(error.toString());
      return null;
    }
  }
}
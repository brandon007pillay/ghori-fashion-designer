import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class GSignInhelp {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final account = await googleSignIn.signIn();
    final auth = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    final res = await _auth.signInWithCredential(credential);
    return res.user;
  }

  static logOut(){
    GoogleSignIn().signOut();
    return _auth.signOut();
  }

}

DocumentReference userRef;

class Usertype {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    Map<String,dynamic> userData = {
      'name': user.displayName,
      'email': user.email,
      'role' : '',
    };

    final userRef = _db.collection('users').doc(user.uid);
    if((await userRef.get()).exists){
    }else{
      await userRef.set(userData);
    }

  }
}
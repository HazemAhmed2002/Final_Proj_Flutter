import 'package:firebase_auth/firebase_auth.dart';

class FBController{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  Future<bool> createAccount({
  required String email, required String password}) async {
    try{
    UserCredential _usercredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    _usercredential.user!.sendEmailVerification();
    return true;
    }on FirebaseAuthException catch(exception){
    _controlFirebaseAuthException(exception);
    }catch(e){}
    return false;
  }

  Future<bool> login({
  required String email ,required String password
}) async{
    try{
      UserCredential _usercredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(_usercredential.user!.emailVerified){
        return true;
      }

    }on FirebaseAuthException catch(exception){
      _controlFirebaseAuthException(exception);
    }catch(e){}
    return false;
  }

}

void _controlFirebaseAuthException(FirebaseAuthException exception) {
  if (exception.code == 'email-already-in-use'){

  }else{

  }
}
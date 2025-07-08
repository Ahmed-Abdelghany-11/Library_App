import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';

import '../../model/signup_request_dto.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl(this._auth, this._firestore);

  @override
  Future<bool> getCurrentUserState() async {
    User? user = await _auth.authStateChanges().first;
    return user != null;
  }

  @override
  Future<void> signUp(SignupRequestDto request) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: request.email!,
      password: request.password!,
    );

    final uid = credential.user?.uid;

    request.id = uid;

    await _firestore.collection('users').doc(uid).set(request.toJson());
  }
}

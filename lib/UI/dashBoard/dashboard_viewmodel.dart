import 'package:NewsApp/models/news_response.dart';
import 'package:NewsApp/services/api_service.dart';
import 'package:NewsApp/widgets/tools/base_view_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DashBoardViewModel extends BaseViewModel {
  DashBoardViewModel({required ApiService apiService})
      : _apiService = apiService;
  String? name,email;

  final ApiService _apiService;
  List<Articles> articles = [];

  Future<void> dashBoard() async {
    articles = await runBusyFuture(
      _apiService.handleDashBoard(),
    );

  }
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    debugPrint("UID: ${userCredential.user?.uid}");
    debugPrint("Email: ${userCredential.user?.email}");
    debugPrint("Display Name: ${userCredential.user?.displayName}");
    name=userCredential.user?.displayName;
    email=userCredential.user?.email;
    notifyListeners();
  }

}

import 'package:flutter/cupertino.dart';
import 'package:insta_clone/Aunthication/auth_method.dart';

import '../model/User.dart';

class UserProvider with ChangeNotifier{
  User?_user;
  final AuthMethod _authMethods =AuthMethod();

  User get getUser => _user!;

  Future<void> refreshUser() async {
     User user =await _authMethods.getUSerDetails();
     _user = user;
     notifyListeners();
  }
}
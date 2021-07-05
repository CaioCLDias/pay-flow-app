import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _isAuthenticated = true;
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(var user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user);
    return;
  }

  Future<void> currentUser(var user) async {
    final instance = await SharedPreferences.getInstance();
    final user = await instance.get('user');
    return;
  }
}

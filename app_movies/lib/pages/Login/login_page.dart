import 'package:app_movies/pages/Login/%20UserPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:app_movies/core/app_images.dart';
import 'package:app_movies/core/app_colors.dart';
import 'package:app_movies/pages/Home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  UserPreferences get _userPreferences => UserPreferences();

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    await Future.delayed(loginTime);
    final storedPassword = await _userPreferences.getUserPassword(data.name);
    if (storedPassword == null) {
      return 'Usuário não existe';
    }
    if (storedPassword != data.password) {
      return 'A senha informada não confere';
    }
    return null;
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    await Future.delayed(loginTime);
    final userExists = await _userPreferences.userExists(data.name!);
    if (userExists) {
      return 'Usuário já existe';
    }
    await _userPreferences.saveUser(data.name!, data.password!);
    return null;
  }

  Future<String> _recoverPassword(String name) async {
    debugPrint('Name: $name');
    await Future.delayed(loginTime);
    final userExists = await _userPreferences.userExists(name);
    if (!userExists) {
      return 'Usuário não existe';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: AppImages.login,
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: AppColors.backgroundColor,
      ),
    );
  }
}

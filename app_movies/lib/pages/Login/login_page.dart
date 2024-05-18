import 'package:app_movies/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/pages/Home/home_page.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:app_movies/core/app_colors.dart';





const users =  {
  'mateus@gmail.com': '12345',
  'teste@gmail.com': '12345',
  

};

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
  debugPrint('Name: $name');
  return Future.delayed(loginTime).then((_) {
    if (!users.containsKey(name)) {
      return 'User not exists';
    }
    return '';
  });
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
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_modular/flutter_modular.dart';

const users = {
  'psicoajuda@gmail.com': '123456',
  'isaac@gmail.com': '123456',
  'gabriel@gmail.com': '123456',
};

class LoginScreenPage extends StatelessWidget {
  Duration get loginTime => const Duration(milliseconds: 2250);
  const LoginScreenPage({Key? key}) : super(key: key);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Usuario não existe!';
      }
      if (users[data.name] != data.password) {
        return 'Senha incorreta!';
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

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Usuario não existe!';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'PsicoAjuda',
      logo: const AssetImage('assets/images/logo/psicoAjuda.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Modular.to.pushNamed('/home/');
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'E-mail',
        passwordHint: 'Senha',
        confirmPasswordHint: 'Confirmar',
        loginButton: 'LOGAR',
        signupButton: 'REGISTRAR',
        forgotPasswordButton: 'Esqueci minha senha?',
        recoverPasswordButton: 'AJUDA',
        goBackButton: 'VOLTAR',
        confirmPasswordError: 'E-mail ou Senha incorretos!',
        recoverPasswordDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Senha recuperada com sucesso!!',
      ),
      theme: (
        LoginTheme(
          primaryColor: Colors.amber,
          cardTheme: CardTheme(
          color: Colors.yellow.shade100,
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        )
      ),
    );
  }
}
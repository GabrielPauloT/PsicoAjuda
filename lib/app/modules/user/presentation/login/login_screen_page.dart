import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:psicoajuda/app/modules/user/data/user_provider.dart';

const users = {
  'psicoajuda@gmail.com': '123456',
  'isaac@gmail.com': '123456',
  // 'gabriel@gmail.com': '123456',
};

class LoginScreenPage extends StatelessWidget {
  Duration get loginTime => const Duration(milliseconds: 2250);
  const LoginScreenPage({Key? key}) : super(key: key);

  Future<String?> _authUser(BuildContext context, LoginData data) async {
  debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
  try {
    final response = await Dio().post(
      'http://192.168.0.101:3001/user/login',
      data: {
        'email': data.name,
        'password': data.password,
      },
    );
    debugPrint('Signup Name: ${response.data}');
    if (response.statusCode == 404) {
      return 'Email ou senha incorretos. Tente novamente.';
    }
    if (response.statusCode == 406) {
      return 'Usuário não existe. Tente novamente.';
    } else {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.loginUser(data.name, data.password);
      debugPrint(userProvider.loggedInUser);
      return null;
    }
  } catch (e) {
    return "Erro: $e";
  }
}

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
      final response = await Dio().post(
        'http://192.168.0.101:3001/user/',
        data: {
          'email': data.name,
          'password': data.password,
          'nome': data.additionalSignupData
        },
      );
      debugPrint('Signup Name: ${response.data}');
      
      if (response.data == "Usuário já existe") {
        return 'Usuário já existe. Tente novamente.';
      }
      else {
        return null;
      }
    } catch (e) {
      return "Erro: $e";
    }
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
      onLogin: (loginData) => _authUser(context, loginData),
      onSignup: _signupUser,
      additionalSignupFields:[
        UserFormField(
          displayName: 'Nome',
          keyName: 'nome',
          fieldValidator: (value) {
            if (value == null) {
              return 'Por favor, informe seu nome';
            }
            else {
              return null;
            }
          },
        )
      ],
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
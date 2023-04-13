import 'package:flutter_modular/flutter_modular.dart';
import 'package:psicoajuda/app/modules/login/presentation/login_screen_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginScreenPage()),
  ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'home/presentation/home_page.dart';
import 'user/presentation/login/login_screen_page.dart';
import 'user/presentation/profile/profile_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginScreenPage()),
  ];
}

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
  ];
}

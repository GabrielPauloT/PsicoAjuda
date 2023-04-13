import 'package:flutter_modular/flutter_modular.dart';
import 'package:psicoajuda/app/modules/home/home_module.dart';
import 'package:psicoajuda/app/modules/login/login_screen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];

}
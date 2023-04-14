import 'package:flutter_modular/flutter_modular.dart';
import 'package:psicoajuda/app/modules/module_route.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/profile', module: ProfileModule()),
  ];

}
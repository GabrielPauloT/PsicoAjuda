import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import '../../data/user_provider.dart';
import '../../data/users.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  UserData? userData;

@override
void initState() {
  super.initState();
  fetchUserData();
}


Future<UserData?> fetchSomeData(String? userName, String? senha) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
      'http://192.168.0.101:3001/user/',
      data: {
        'email': userName,
        'password': senha,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data;

      return UserData(
        name: responseData['name'],
        email: responseData['email'],
        foto: 'https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2015/09/26/150926165742__85730600_monkey2.jpg',
        id: responseData['id'],
        funcao: responseData['funcao'],
      );
    } else {
      print("Erro na requisição");
      debugPrint("Erro na requisição");
    }
  } catch (e) {
    print("Erro: $e");
  }

  return null;
}

  void fetchUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userName = userProvider.loggedInUser;
    final senha = userProvider.loggedInUserPassword;

    UserData? fetchedUserData = await fetchSomeData(userName, senha);
    if (fetchedUserData != null) {
      setState(() {
        userData = fetchedUserData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meu Perfil'),
        flexibleSpace: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(255, 185, 5, 1),
                Color.fromRGBO(255, 166, 1, 1),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 80,
              // backgroundImage: NetworkImage(userData?.foto ?? ''),
              backgroundImage: NetworkImage(
                'https://s1.static.brasilescola.uol.com.br/be/2021/02/mico-leao-dourado.jpg', // URL de exemplo
              ),
            ),
            const SizedBox(height: 20),
            Text(
              userData?.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userData?.email ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Descrição do usuário. Pode ser um texto longo descrevendo informações adicionais sobre o usuário.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para editar o perfil
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 123, 255, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Editar Perfil'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Deslogar'),
            ),
          ],
        ),
      ),
    );
  }
}

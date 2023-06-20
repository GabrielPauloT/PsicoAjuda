import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:psicoajuda/app/modules/user/data/user_provider.dart';
import 'user.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<User> users = [];
  List<User> usersSearch = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchSomeData();
  }

  void fetchSomeData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        'http://192.168.0.101:3001/user/',
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;

        setState(() {
          users = responseData
              .map((userJson) => User(
                    id: userJson['id'],
                    name: userJson['name'],
                    email: userJson['email'],
                    funcao: userJson['funcao'],
                    foto:
                        'https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2015/09/26/150926165742__85730600_monkey2.jpg',
                  ))
              .toList();
          usersSearch = List.from(users);
        });
      } else {
        print("Erro na requisição");
        debugPrint("Erro na requisição");
      }
    } catch (e) {
      print("Erro: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userName = userProvider.loggedInUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: searchUser,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: "Pesquise por um psicólogo",
                    hintText: "Pesquise por um psicólogo",
                    prefixIcon: Icon(Icons.search),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    fillColor: Color.fromRGBO(236, 239, 198, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  margin: const EdgeInsets.fromLTRB(49, 15, 30, 0),
                  height: 94.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 116, 116, 116)
                            .withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    color: const Color.fromARGB(255, 255, 255, 250),
                  ),
                  child: ListTile(
                    onTap: () async {
                      final currentUserEmail = userName;
                      final selectedUserEmail = user.email;

                      final chatRoomId = await checkChatRoomExists(
                        currentUserEmail!,
                        selectedUserEmail,
                      );
                      print('print chatRoomID: $chatRoomId');

                      Modular.to
                          .pushNamed('/chat/$chatRoomId', arguments: user.name);
                    },
                    title: Text(user.name),
                    subtitle: Text(user.funcao),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.black45,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void searchUser(String query) {
    final user = usersSearch.where((user) {
      final userName = user.name.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();
    setState(() => users = user);
  }

  Future<String> checkChatRoomExists(
      String currentUserEmail, String selectedUserEmail) async {
    final querySnapshot =
        await firestore.collection('chatRooms').where('users', whereIn: [
      [currentUserEmail, selectedUserEmail],
      [selectedUserEmail, currentUserEmail]
    ]).get();

    if (querySnapshot.docs.isNotEmpty) {
      final chatRoomId = querySnapshot.docs.first.id;
      return chatRoomId;
    } else {
      final newChatRoomRef = await firestore.collection('chatRooms').add({
        'users': [currentUserEmail, selectedUserEmail],
      });

      final newChatRoomId = newChatRoomRef.id;
      return newChatRoomId;
    }
  }
}

import 'package:flutter/material.dart';
import 'user.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<User> users = allUsers;

  @override
  Widget build(BuildContext context) {
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
            )),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        fillColor: Color.fromRGBO(236, 239, 198, 1)),
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
                  final book = users[index];
                  return Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      margin: const EdgeInsets.fromLTRB(49, 15, 30, 0),
                      height: 94.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 116, 116, 116)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ], color: const Color.fromARGB(255, 255, 255, 250)),
                      child: ListTile(
                        title: Text(book.name),
                        subtitle: Text(book.tipo),
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black45,
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }

  void searchUser(String query) {
    final user = allUsers.where((users) {
      final userName = users.name.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();
    setState(() => users = user);
  }
}

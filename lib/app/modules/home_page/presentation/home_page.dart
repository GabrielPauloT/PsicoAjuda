import 'package:flutter/material.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Pisco Ajuda'),
          alignment: Alignment.center,
        ),
        automaticallyImplyLeading: false,
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
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                height: 137.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 116, 116, 116)
                            .withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 6), // changes position of shadow
                      ),
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(149, 0, 255, 1),
                        Color.fromRGBO(191, 100, 255, 1),
                      ],
                    )),
                child: ListView(
                  children: [
                    Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('O que se trata a psicanálise?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 2.0,
                              )),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Além de promover o autoconhecimento e melhorar o controle emocional, a terapia psicanalítica é utilizada para descobrir traumas da infância, depressão, transtornos de ansiedade, problemas sexuais, entre outras questões internas, e tratá-las',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 2.0,
                                ))),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                  child: ListView(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('O que é Psicologia Humanista?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2.0,
                          )),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'É a perspectiva da psicologia que apoia a crença de que os seres humanos, como indivíduos, são seres únicos e devem ser reconhecidos e tratados como tal por psicólogos e psiquiatras.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 2.0,
                            ))),
                  ]),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  height: 117.0,
                  width: 145.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 116, 116, 116)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(255, 183, 0, 1),
                          Color.fromRGBO(255, 188, 63, 1),
                        ],
                      ))),
              Container(
                  child: ListView(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('O que é behaviorismo ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2.0,
                          )),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'O Behaviorismo é uma teoria da psicologia que avalia o comportamento de seres humanos e animais, a partir de análises fundamentadas e da observação de fatos práticos como, por exemplo, reações a estímulos.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 2.0,
                            ))),
                  ]),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  height: 117.0,
                  width: 145.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 116, 116, 116)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(255, 183, 0, 1),
                          Color.fromRGBO(255, 188, 63, 1),
                        ],
                      ))),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                height: 187.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 116, 116, 116)
                            .withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 6), // changes position of shadow
                      ),
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(149, 0, 255, 1),
                        Color.fromRGBO(191, 100, 255, 1),
                      ],
                    )),
                child: ListView(
                  children: [
                    Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Como funciona a TCC terapia cognitiva comportamental?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 2.0,
                              )),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'A Terapia Cognitiva-Comportamental é uma abordagem estruturada, estabelecida a partir da colaboração entre terapeuta e paciente. A técnica consiste em buscar uma reestruturação cognitiva sobre emoções e comportamentos, por meio de intervenções sobre as cognições baseadas em eventos significativos para o paciente.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 2.0,
                                ))),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: const EdgeInsets.fromLTRB(30, 25, 30, 30),
                  height: 117.0,
                  width: 145.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 116, 116, 116)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(255, 183, 0, 1),
                          Color.fromRGBO(255, 188, 63, 1),
                        ],
                      )),
                  child: ListView(children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('O que é terapia fenomenológico existencial?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2.0,
                          )),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'A Psicologia fenomenológica-existencial é um dos muitos ramos da Psicologia. Considerada como a terceira força, ao lado da psicanálise e da psicologia comportamental. Essa psicologia é uma forma de se pensar o mundo, surgida na filosofia. Não se tem somente uma pessoa responsável por tal pensamento.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 2.0,
                            ))),
                  ])),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: const EdgeInsets.fromLTRB(30, 25, 30, 30),
                  height: 117.0,
                  width: 145.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 116, 116, 116)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(255, 183, 0, 1),
                          Color.fromRGBO(255, 188, 63, 1),
                        ],
                      )),
                  child: ListView(children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('O que é uma abordagem junguiana?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2.0,
                          )),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Psicologia analítica, também conhecida como psicologia junguiana ou psicologia complexa, é um ramo de conhecimento e prática da Psicologia, iniciado por Carl Gustav Jung. Ela enfatiza a importância da psique, do inconsciente, dos arquétipos e do processo de individuação.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 2.0,
                            ))),
                  ])),
            ],
          ),
        ],
      ),
    );
  }

  void searchUser(String query) {
    final user = allUsers.where((users) {
      final userName = users.name.toLowerCase();
      final input = query.toLowerCase();
      return userName.contains(input);
    }).toList();
    setState(() => users = user);
  }

  void teste() {}
}

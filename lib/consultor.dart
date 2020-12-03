import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:estimulo2020/perfilData/config.dart' as globals;

class Consultor extends StatefulWidget {
  Consultor({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Consultor createState() => _Consultor();
}

class _Consultor extends State<Consultor> {
  String text = "";
  bool botaoDisable = false;
  TextEditingController questao1Controller = TextEditingController();
  TextEditingController questao2Controller = TextEditingController();
  TextEditingController questao3Controller = TextEditingController();
  TextEditingController questao4Controller = TextEditingController();
  TextEditingController questao5Controller = TextEditingController();

  handleEnviar() async {
    botaoEnviar();
    print("teste");
    print(questao1Controller.text);
    print(questao2Controller.text);
    print(questao3Controller.text);
    print(questao4Controller.text);
    print(questao5Controller.text);
    var url = "https://estimulo-2020.herokuapp.com/userEstimulo/" + globals.id;

    Map<String, String> headers = {"Content-type": "application/json"};
    final body = jsonEncode({
      "questao1": questao1Controller.text,
      "questao2": questao2Controller.text,
      "questao3": questao3Controller.text,
      "questao4": questao4Controller.text,
      "questao5": questao5Controller.text
    });

    var res = await http.patch(url, headers: headers, body: body);
    print(res.body);
    text = "Enviado com sucesso!";
    botaoEnviar();
  }

  @protected
  @mustCallSuper
  void initState() {
    //fazer api pra retornar o salvo
  }

  botaoEnviar() {
    setState(() {
      botaoDisable = !botaoDisable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Estímulo 2020 | Consultoria"),
          ],
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
            child: Column(
              children: [
                Text(""),
                Container(
                  //padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  decoration: BoxDecoration(
                    //color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: Image.network(
                          "https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Eder Nolasco Barcelos",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Idade: 35",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Faculdade: Fundação Instituto e Administração",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Curso: FIA  - Finanças Corporativas e Investment Banking",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email: eder.nolasco@estimulo.com.br",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Text(""),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Apresentação: Nolasco é formado e tem pós-graduação em finaças corporativas desde 2010. Trabalhou em grandes empresas comoBanco Inter, Nubank e entre outras. Atualmente Eder está trabalhando como conselheiro no Projeto Estímulo 2020 ajudando aspessoas a administrar melhor suas finanças.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Text(""),
                Container(
                  //padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  decoration: BoxDecoration(
                    //color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: Image.network(
                          "https://static.vecteezy.com/system/resources/thumbnails/001/196/560/small/person.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Roberto Tedim Reis",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Idade: 29",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Faculdade: UNA",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Curso: Comunicação e Marketing",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email: tedim.reis@estimulo.com.br",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Text(""),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Apresentação: Tedim fez pós graduação na UNA e hoje é MBA em Comunicação e Marketing. É uma pessoa super dedicada ao seu trabalho e hoje no seu tempo livre atua como conselheiro no Projeto Estímulo 2020. Está disposto a passar todo seu conhecimento em comunicação e marketing, podendo assim auxilar melhor seus alunos.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Text(""),
                Container(
                  //padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  decoration: BoxDecoration(
                    //color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: Image.network(
                          "https://webstockreview.net/images/clipart-woman-cellphone-19.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Isabela Seixas Padilha",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Idade: 27",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Faculdade: ESAB  - Escola Superior Aberta do Brasil",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Curso: Gestão da Tecnologia e Inovação",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email: isabela.seixas@estimulo.com.br",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Text(""),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Apresentação: Seixas é formada em Gestão da Tecnologia e Inovação pela ESAB  - Escola Superior Aberta do Brasil. Com muitos anos no mercado e trabalhando em inúmeras empresas do ramo, hoje ela está de prontidão para passar todo o seu conhecimento para os alunos do projeto Estímulo 2020.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Text(""),
                Container(
                  //padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  decoration: BoxDecoration(
                    //color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: Image.network(
                          "https://static.vecteezy.com/system/resources/thumbnails/001/196/554/original/person.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Camila Fortunato Rua",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Idade: 28",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Faculdade: Pitágoras",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Curso: Gestão de Recursos Humanos",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email: camila.fortunato@estimulo.com.br",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Text(""),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Apresentação: Fortunato é formada em técnologo em Gestão de Recursos Humanos na faculdade Pitágoras. Hoje ela está de disposta a passar todo o seu conhecimento para os alunos do projeto Estímulo 2020.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

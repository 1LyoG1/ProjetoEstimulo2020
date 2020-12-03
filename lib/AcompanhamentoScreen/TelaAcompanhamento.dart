import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:estimulo2020/perfilData/config.dart' as globals;
import 'package:estimulo2020/AcompanhamentoScreen/primeiroAcompanhamento.dart';
import 'package:estimulo2020/AcompanhamentoScreen/SegundoAcompanhamento.dart';
import 'package:estimulo2020/AcompanhamentoScreen/TerceiroAcompanhamento.dart';

class Acompanhamento extends StatefulWidget {
  Acompanhamento({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Acompanhamento createState() => _Acompanhamento();
}

class _Acompanhamento extends State<Acompanhamento> {
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
            Text("Estímulo 2020 | Acompanhamento"),
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
                Center(
                  child: Text(
                    "Acompanhamento",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(""),
                // Container(
                //   padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                // ),
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
                          "https://universodoagronegocio.com.br/assets/imgs/Planta_ninho_completa.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Etapa Inicial",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PrimeiroAcompanhamento()));
                        },
                      ),
                    ),
                  ),
                ),
                Text(""),
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
                          "https://images.vexels.com/media/users/3/148692/isolated/preview/4ff28c6516ef2c46843f69010116d898-flowerpot-com-clipart-de-planta-by-vexels.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Etapa Intermediária",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SegundoAcompanhamento()));
                        },
                      ),
                    ),
                  ),
                ),
                Text(""),
                Text(text),
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
                          "https://i.pinimg.com/originals/67/63/22/67632272c94e2bb75f757f39c4a5bf85.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "Etapa Final ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TerceiroAcompanhamento()));
                        },
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

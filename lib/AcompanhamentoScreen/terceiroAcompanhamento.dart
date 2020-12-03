import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:estimulo2020/perfilData/config.dart' as globals;

class TerceiroAcompanhamento extends StatefulWidget {
  TerceiroAcompanhamento({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TerceiroAcompanhamento createState() => _TerceiroAcompanhamento();
}

class _TerceiroAcompanhamento extends State<TerceiroAcompanhamento> {
  String text = "";
  bool botaoDisable = false;
  TextEditingController questao1Controller = TextEditingController();
  TextEditingController questao2Controller = TextEditingController();
  TextEditingController questao3Controller = TextEditingController();

  handleEnviar() async {
    botaoEnviar();
    print("teste");
    print(questao1Controller.text);
    print(questao2Controller.text);
    print(questao3Controller.text);
    var url = "https://estimulo-2020.herokuapp.com/userEstimulo/" + globals.id;

    Map<String, String> headers = {"Content-type": "application/json"};
    final body = jsonEncode({
      "resposta3A": questao1Controller.text,
      "resposta3B": questao2Controller.text,
      "resposta3C": questao3Controller.text,
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
            Text("Estímulo 2020 "),
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
                    "Etapa Final ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(""),
                Text(
                  "O que você achou dos resultados atingidos em comparação aos resultados esperados?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: questao1Controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                Text(""),
                Text(
                  "Qual é a palavra que melhor descreve o a experiência adquirida até então?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: questao2Controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                Text(
                  "Tem algo que queria acrescentar de uma forma geral no projeto Estímulo 2020?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: questao3Controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                Text(text),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ButtonTheme(
                    minWidth: 150,
                    height: 60,
                    child: RaisedButton(
                      onPressed: botaoDisable ? null : () => handleEnviar(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: botaoDisable
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              "Enviar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                      color: Colors.green,
                    ),
                  ),
                ),
                Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

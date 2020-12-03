import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:estimulo2020/perfilData/config.dart' as globals;

class SegundoAcompanhamento extends StatefulWidget {
  SegundoAcompanhamento({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SegundoAcompanhamento createState() => _SegundoAcompanhamento();
}

class _SegundoAcompanhamento extends State<SegundoAcompanhamento> {
  String text = "";
  String resp = "";
  bool botaoDisable = false;
  TextEditingController questao1Controller = TextEditingController();
  TextEditingController questao2Controller = TextEditingController();

  handleEnviar() async {
    botaoEnviar();
    print("teste");
    print(questao1Controller.text);
    print(questao2Controller.text);
    print(resp);
    var url = "https://estimulo-2020.herokuapp.com/userEstimulo/" + globals.id;

    Map<String, String> headers = {"Content-type": "application/json"};
    final body = jsonEncode({
      "resposta2A": questao1Controller.text,
      "resposta2B": questao2Controller.text,
      "resposta2C": resp,
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
                    "Etapa Intermediária",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(""),
                Text(
                  "Quais habilidades os empregados da sua empresa adquiriram com os conhecimentos ensinados aqui?",
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
                  "Os resultados melhoraram ou pioraram com o passar do tempo?",
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
                Text(""),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Escolha a frequência que você precisou do recurso de consultoria (1 - Pouca/Não ocorreu, 2- Algumas vezes, 3- Muitas vezes)",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                  Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                            
                              Row(
                                children: [
                                  Radio(
                                    value: "1",
                                    groupValue: resp,
                                    onChanged: (value) {
                                      setState(() {
                                        resp = value;
                                        print(resp);
                                      });
                                    },
                                  ),
                                  Text('1'),
                                  Radio(
                                    value: "2",
                                    groupValue: resp,
                                    onChanged: (value) {
                                      setState(() {
                                        resp = value;
                                        print(resp);
                                      });
                                    },
                                  ),
                                  Text('2'),
                                   Radio(
                                    value: "3",
                                    groupValue: resp,
                                    onChanged: (value) {
                                      setState(() {
                                        resp = value;
                                        print(resp);
                                      });
                                    },
                                  ),
                                  Text('3'),
                                ],
                              ),
                            ],
                          ),
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

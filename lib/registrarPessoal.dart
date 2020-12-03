import 'package:estimulo2020/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaginaCadastro extends StatefulWidget {
  PaginaCadastro({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PaginaCadastro createState() => _PaginaCadastro();
}

class _PaginaCadastro extends State<PaginaCadastro> {
  var alertRegister = "";
  var invalidPass = false;

  var _formKey = GlobalKey<FormState>();
  bool isForm2 = false;

  bool botaoDisable = false;

  TextEditingController nomeCompleto = TextEditingController();
  TextEditingController enderecoCompleto = TextEditingController();
  TextEditingController telefone = TextEditingController();

  TextEditingController emailControler = TextEditingController();
  TextEditingController senha1Controler = TextEditingController();
  TextEditingController senha2Controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    alertDenied() {
      setState(() => {
            alertRegister = "As senhas precisam ser idênticas!",
            invalidPass = true
          });
    }

    botaoRegister() {
      setState(() {
        botaoDisable = !botaoDisable;
      });
    }

    clearField() {
      nomeCompleto.text = "";
      enderecoCompleto.text = "";
      telefone.text = "";
      emailControler.text = "";
      senha2Controler.text = "";
    }

    handleRegister() async {
      var isValid = _formKey.currentState.validate();

      if (!isValid) {
        return;
      }

      if (senha1Controler.text != senha2Controler.text) {
        alertDenied();
        return;
      } else {
        botaoRegister();

        var url = "https://estimulo-2020.herokuapp.com/userEstimulo";
        Map<String, String> headers = {"Content-type": "application/json"};

        final body = jsonEncode({
          "nomePessoal": nomeCompleto.text,
          "enderecoPessoal": enderecoCompleto.text,
          "telefonePessoal": telefone.text,
          "email": emailControler.text,
          "senha": senha2Controler.text,
        });

        var res = await http.post(url, headers: headers, body: body).then(
              (value) => {
                if (value.statusCode == 200)
                  {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (Route<dynamic> route) => false),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp())),
                    clearField(),
                    print("enviando"),
                  }
                else
                  {
                    print("errou"),
                    clearField(),
                  }
              },
            );
      }

      botaoRegister();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //Icon(Icons.verified_user),
            Text("Estímulo 2020 | Cadastro"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          // child: Center(
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "https://www.estimulo2020.org/wp-content/uploads/2020/08/Logo-Estimulo-2020-Minas-Horizontal-min.png",
                  width: 300,
                  height: 100,
                ),
                Text(
                  "Dados Pessoais",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nomeCompleto,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Nome Completo",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Icon(
                                  Icons.person,
                                ),
                              )),
                        ),
                        TextFormField(
                          controller: enderecoCompleto,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Endereço Completo",
                              icon: Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Icon(
                                    Icons.home,
                                  ))),
                        ),
                        TextFormField(
                          controller: telefone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Telefone",
                              icon: Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Icon(Icons.phone))),
                        ),
                        TextFormField(
                          controller: emailControler,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "E-mail",
                              icon: Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Icon(Icons.email))),
                        ),
                        TextFormField(
                          controller: senha1Controler,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Senha",
                              icon: Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Icon(Icons.lock))),
                          obscureText: true,
                        ),
                        TextFormField(
                          controller: senha2Controler,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Confirmar Senha",
                            icon: Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Icon(Icons.lock),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(alertRegister,
                    style: invalidPass
                        ? TextStyle(color: Colors.red, fontSize: 15)
                        : TextStyle(color: Colors.green, fontSize: 15)),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ButtonTheme(
                    minWidth: 150,
                    height: 60,
                    child: RaisedButton(
                      onPressed: botaoDisable ? null : () => handleRegister(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: botaoDisable
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              "Registrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }
}

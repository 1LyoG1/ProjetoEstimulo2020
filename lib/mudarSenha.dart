import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:estimulo2020/perfilData/config.dart' as globals;
import 'package:http/http.dart' as http;

class PaginaMudarSenha extends StatefulWidget {
  PaginaMudarSenha({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PaginaMudarSenha createState() => _PaginaMudarSenha();
}

class _PaginaMudarSenha extends State<PaginaMudarSenha> {
  var _formKey = GlobalKey<FormState>();
  bool botaoDisable = false;
  var alertRegister = "";
  var invalidPass = false;
  TextEditingController senhaControler = TextEditingController();
  TextEditingController repetirSenhaControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    botaoLogin() {
      setState(() {
        botaoDisable = !botaoDisable;
      });
    }

    alertSucess() {
      setState(() => {
            alertRegister = "Senha alterada com sucesso!!!",
            invalidPass = false
          });
    }

    alertDenied() {
      setState(() => {
            alertRegister = "As senhas precisam ser idênticas!",
            invalidPass = true
          });
    }

    clearField() {
      senhaControler.text = "";
      repetirSenhaControler.text = "";
    }

    mudarSenha(String novaSenha) async {
      var isValid = _formKey.currentState.validate();

      if (!isValid) {
        return;
      }
      if (senhaControler.text != repetirSenhaControler.text) {
        alertDenied();
      } else {
        botaoLogin();
        var url =
            "https://estimulo-2020.herokuapp.com/userEstimulo/" + globals.id;

        Map<String, String> headers = {"Content-type": "application/json"};
        final body = jsonEncode({
          "email": globals.email,
          "senha": novaSenha,
        });

        var res = await http.patch(url, headers: headers, body: body);
        print(res.body);
        botaoLogin();
        alertSucess();
        clearField();
        // Navigator.pop(context, MaterialPageRoute(builder: (context) => perfil()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Estímulo 2020 | Mudar senha"),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        // child: Center(
        child: Container(
          child: Column(
            children: [
              Text(""),
              Center(
                child: Text(
                  "Digite sua nova senha",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preenchimento obrigatório!';
                          }
                          return null;
                        },
                        controller: senhaControler,
                        decoration: InputDecoration(
                            labelText: "Nova senha",
                            icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Icon(Icons.lock))),
                        obscureText: true,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preenchimento obrigatório!';
                          }
                          return null;
                        },
                        controller: repetirSenhaControler,
                        decoration: InputDecoration(
                            labelText: "Repetir nova senha",
                            icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Icon(Icons.lock))),
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
                    onPressed: botaoDisable
                        ? null
                        : () => mudarSenha(repetirSenhaControler.text),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: botaoDisable
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : Text(
                            "Enviar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:estimulo2020/registrarPessoal.dart';
import 'package:estimulo2020/esqueciSenha.dart';
import 'package:estimulo2020/Router/router.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:estimulo2020/perfilData/config.dart' as globals;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estimulo 2020',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaginaLogin(title: 'Estimulo 2020'),
    );
  }
}

class PaginaLogin extends StatefulWidget {
  PaginaLogin({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PaginaLogin createState() => _PaginaLogin();
}

@override
void initState() {}

class _PaginaLogin extends State<PaginaLogin> {
  var acessDeniedMSG = "";
  var _formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController senhaControler = TextEditingController();
  bool botaoDisable = false;

  acessDenied() {
    setState(() {
      acessDeniedMSG = "Usuário não encontrado!";
    });
  }

  handleLogin(String email, String senha) async {
    var isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    botaoLogin();
    var url = "https://estimulo-2020.herokuapp.com/userEstimulo/validUser";
    Map<String, String> headers = {"Content-type": "application/json"};
    dynamic jsonParsed = "";
    final body = jsonEncode({"email": email, "senha": senha});
    var respostaJson = "";

    var res =
        await http.post(url, headers: headers, body: body).then((retorno) => {
              //print(retorno.body),
              jsonParsed = json.decode(retorno.body),

              //print(jsonParsed[0]["_id"]),
              if (retorno.body.length > 2)
                {
                  //DADOS PESSOAIS
                  globals.id = jsonParsed[0]["_id"],
                  globals.email = jsonParsed[0]["email"],
                  globals.enderecoPessoal = jsonParsed[0]["enderecoPessoal"],
                  globals.senha = jsonParsed[0]["senha"],
                  globals.telefone = jsonParsed[0]["telefonePessoal"],
                  globals.nome = jsonParsed[0]["nomePessoal"],

                  globals.isFormDone = jsonParsed[0]["isFormDone"],
                  print(globals.isFormDone),
                  //DADOS DA EMPRESA
                  globals.razaoSocial = jsonParsed[0]["razaoSocial"],
                  globals.telefoneEmpresa = jsonParsed[0]["telefoneComercial"],
                  globals.cnpj = jsonParsed[0]["cnpj"],
                  globals.endereco = jsonParsed[0]["enderecoComercial"],
                  globals.municipio = jsonParsed[0]["municipio"],
                  globals.estado = jsonParsed[0]["estado"],
                  print("Logado com sucesso!"),
                  botaoLogin(),

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Router()),
                      (Route<dynamic> route) => false),
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Router()),
                  // )
                }
              else
                {print("Login invalido!"), botaoLogin(), acessDenied()}
            });
  }

  botaoLogin() {
    setState(() {
      botaoDisable = !botaoDisable;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              //Icon(Icons.verified_user),
              Text("Estímulo 2020 | Login"),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                    child: Container(
                      child: Column(
                        children: [
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
                            obscureText: false,
                          ),
                          TextFormField(
                            controller: senhaControler,
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
                        ],
                      ),
                    ),
                  ),
                  Text(
                    acessDeniedMSG,
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ButtonTheme(
                      minWidth: 150,
                      height: 60,
                      child: RaisedButton(
                        onPressed: botaoDisable
                            ? null
                            : () => handleLogin(
                                emailControler.text, senhaControler.text),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        child: botaoDisable
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                "Entrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PaginaEsqueciSenha(emailControler)),
                      )
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(120),
                    child: ButtonTheme(
                      minWidth: 150,
                      height: 60,
                      child: RaisedButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaginaCadastro()),
                          )
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Text(
                          "Registrar-se",
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
          ),
        ));
  }
}

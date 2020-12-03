import 'package:estimulo2020/main.dart';
import 'package:estimulo2020/perfilData/config.dart' as globals;
import 'mudarSenha.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  Perfil({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  bool dadoP = false;
  bool dadoE = false;
  @override
  Widget build(BuildContext context) {
    showDadoP() {
      setState(() => {
            dadoP = !dadoP,
          });
    }

    showDadoE() {
      setState(() => {
            dadoE = !dadoE,
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //Icon(Icons.verified_user),
            //"Estímulo 2020 | Esqueci senha"
            Text("Estímulo 2020 | Perfil"),
          ],
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(""),
                // Center(
                //   child: Text(
                //     "Perfil do usuario",
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 19,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: RaisedButton.icon(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (Route<dynamic> route) => false),
                      icon: Icon(Icons.arrow_forward),
                      label: Text("Sair"),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.kindpng.com/picc/m/78-785917_user-login-function-name-avatar-user-icon-hd.png"),
                    ),
                  ),
                ),
                Text(
                  globals.nome,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(""),

                Container(
                  //padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    //color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.0),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Column(
                          children: [
                            Text(
                              "Dados Pessoais ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            dadoP
                                ? Icon(Icons.keyboard_arrow_up)
                                : Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                        subtitle: dadoP
                            ? Column(
                                children: [
                                  Text(""),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "E-mail: " + globals.email,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Telefone: " + globals.telefone,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Endereço: " +
                                                globals.enderecoPessoal,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(""),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Text(""),
                        onTap: () {
                          showDadoP();
                        },
                      ),
                    ),
                  ),
                ),
                Text(""),
                globals.isFormDone
                    ? Container(
                        //padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                        decoration: BoxDecoration(
                          //border: Border.all(width: 1),
                          //color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.0),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Card(
                            color: Colors.grey[200],
                            child: ListTile(
                              title: Column(
                                children: [
                                  Text(
                                    "Dados da Empresa ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  dadoE
                                      ? Icon(Icons.keyboard_arrow_up)
                                      : Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                              subtitle: dadoE
                                  ? Column(
                                      children: [
                                        Text(""),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Razão Social: " +
                                                      globals.razaoSocial,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Telefone: " +
                                                      globals.telefone,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "CNPJ: " + globals.cnpj,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Endereço: " +
                                                      globals.endereco,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Municipio: " +
                                                      globals.municipio,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Estado: " + globals.estado,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(""),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(""),
                              onTap: () {
                                showDadoE();
                              },
                            ),
                          ),
                        ),
                      )
                    : Text(""),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          //minWidth: 150,
                          //height: 60,
                          child: RaisedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaginaMudarSenha()),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Text(
                              "Mudar Senha",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
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

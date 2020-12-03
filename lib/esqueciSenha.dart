import 'package:flutter/material.dart';

class PaginaEsqueciSenha extends StatelessWidget {
  TextEditingController email;
  

  PaginaEsqueciSenha(this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //Icon(Icons.verified_user),
            //"Estímulo 2020 | Esqueci senha"
            Text("Estímulo 2020 | Esqueci senha"),
          ],
        ),
      ),
      body: Form(
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
                        controller: this.email,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Icon(Icons.email))),
                        obscureText: false,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ButtonTheme(
                  minWidth: 150,
                  height: 60,
                  child: RaisedButton(
                    onPressed: () => {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
    );
  }
}

// return Scaffold(
//       appBar: AppBar(
//         title: Text("Segunda Rota (tela)"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Retornar !'),
//         ),
//       ),
//     );

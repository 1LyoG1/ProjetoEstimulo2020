import 'package:flutter/material.dart';

import 'package:estimulo2020/Modulos/comunicacaoMaketing.dart';
import 'package:estimulo2020/Modulos/gestaoRH.dart';
import 'package:estimulo2020/Modulos/tecnologiaInovacao.dart';
import 'package:estimulo2020/Modulos/financeiro.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estimulo 2020',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.black,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Text("Estímulo 2020 | Home"),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(""),
                Center(
                  child: Text(
                    "Trilha de Capacitação em Gestão de Negócio",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
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
                        color: Colors.black.withOpacity(0.2),
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
                          "https://cdn.discordapp.com/attachments/745455883294605375/782297529235669002/chartfinancefinancialfinancialreportflipchartreport-1320167737228728676.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                "Módulo Financeiro",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        subtitle: Text(
                          "Permite completa visibilidade das suas contas a pagar e contas a receber, acesso a faturas pendentes, extrato e fluxo de caixa. Tudo em tempo real, possibilitando decisões mais rápidas e mais inteligentes.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => financeiro()),
                          );
                        },
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
                        color: Colors.black.withOpacity(0.2),
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
                          "https://media.discordapp.net/attachments/745455883294605375/782298691604185088/Social_Media_Marketing-512.png?width=475&height=475",
                          width: 60,
                          height: 190,
                        ),
                        title: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                "Módulo Comunicação e Marketing",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        subtitle: Text(
                          "A Estratégia de Comunicação orienta como conquistar atenção do público-alvo, direcionando os padrões de design, tom de voz, canais de marketing e argumentação comercial.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => comunicacaoMarketing()),
                          );
                        },
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
                        color: Colors.black.withOpacity(0.2),
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
                          "https://media.discordapp.net/attachments/745455883294605375/782299388470755368/8-2-innovation-free-png-image.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                "Módulo Tecnologia e Inovação",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        subtitle: Text(
                          "Cursos desta área estão em ascensão pois cada vez mais a tecnologia está e estará mais presente em nossa vida. A tecnologia já está transformando a forma em que vivemos, trabalhamos e nos relacionamos com as outras pessoas.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tecnologiaInovacao()));
                        },
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
                        color: Colors.black.withOpacity(0.2),
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
                          "https://media.discordapp.net/attachments/745455883294605375/782299854751531008/inovation-icon-10.png?width=475&height=475",
                          width: 60,
                          height: 190,
                        ),
                        title: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                "Módulo Gestão de RH",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        subtitle: Text(
                          "Gestão de Recursos Humanos é um conjunto de habilidades, métodos e práticas que visa o desenvolvimento e potencialização do capital humano das empresas. A gestão de RH é, portanto, responsável por adquirir, desenvolver, utilizar e reter talentos para a instituição.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => gestaoRH()));
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

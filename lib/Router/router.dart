import 'package:estimulo2020/registrarEmpresa.dart';
import 'package:flutter/material.dart';
import 'package:estimulo2020/AcompanhamentoScreen/TelaAcompanhamento.dart';
import 'package:estimulo2020/home.dart';
import 'package:estimulo2020/perfilData/config.dart' as globals;
import 'package:estimulo2020/perfil.dart';
import 'package:estimulo2020/consultor.dart';

class Router extends StatefulWidget {
  Router({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _router createState() => _router();
}

class _router extends State<Router> {
  int currentTabIndex = 1;
  List tabs = [
    Acompanhamento(),
    home(),
    globals.isFormDone ? Consultor() : PaginaCadastro2(),
    Perfil(),
    Perfil(),
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

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
          bottomNavigationBar: globals.isFormDone
              ? BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  onTap: onTapped,
                  currentIndex: currentTabIndex,
                  //type: BottomNavigationBarType.fixed,

                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.rate_review),
                      title: Text('Feedback'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.live_help),
                      title: Text('Consultoria'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text('Perfil'),
                    )
                  ],
                )
              : BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  onTap: onTapped,
                  currentIndex: currentTabIndex,
                  //type: BottomNavigationBarType.fixed,

                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.rate_review),
                      title: Text('Feedback'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.format_list_bulleted),
                      title: Text('Formulário'),
                    ),
                   
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text('Perfil'),
                    )
                  ],
                ),
          body: tabs[currentTabIndex],
        ));
  }
}

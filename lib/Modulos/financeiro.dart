import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class financeiro extends StatelessWidget {
  abrirUrl() async {
    const url =
        'https://www.youtube.com/watch?v=CNU5IMQAdn4&ab_channel=UniversidadeFinanceira';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //Icon(Icons.verified_user),
            //"Estímulo 2020 | Esqueci senha"
            Text("Estímulo 2020 | Financeiro"),
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
                Center(
                  child: Text(
                    "Videos do módulo financeiro",
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 1",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 2",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 3",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 4",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 5",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 6",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 4",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 8",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 9",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
                    ),
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
                          "https://cdn.iconscout.com/icon/free/png-256/youtube-85-226402.png",
                          width: 60,
                          height: 190,
                        ),
                        title: Text(
                          "Video 10",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ac lectus eu nunc eleifend egestas. Quisque lectus ante, vulputate in leo sed, tempus sollicitudin neque.",
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          abrirUrl();
                        },
                      ),
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

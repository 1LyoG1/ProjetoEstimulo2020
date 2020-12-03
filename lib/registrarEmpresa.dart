import 'package:estimulo2020/Router/router.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:estimulo2020/perfilData/config.dart' as globals;
import 'dart:convert';

class CheckBoxModel {
  CheckBoxModel({this.texto, this.checked = false});

  String texto;
  bool checked;
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key key, this.item}) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.item.checked,
      title: Text(widget.item.texto),
      onChanged: (bool value) {
        setState(() {
          widget.item.checked = value;
        });
      },
    );
  }
}

class PaginaCadastro2 extends StatefulWidget {
  PaginaCadastro2({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  _PaginaCadastro2 createState() => _PaginaCadastro2();
}

class _PaginaCadastro2 extends State<PaginaCadastro2> {
  var alertRegister = "";
  var invalidPass = false;

  var _formKey = GlobalKey<FormState>();

  TextEditingController razaoSocialController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();

  TextEditingController idadeController = TextEditingController();
  TextEditingController numeroFuncionarioController = TextEditingController();

  TextEditingController enderecoComercialController = TextEditingController();
  TextEditingController municipoController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController telefoneComercialController = TextEditingController();

  bool botaoDisable = false;

//form
  bool negocioFamiliar = null;
  String faturamento = "";
  String setorEmpresa = "";
  String segmentacao = "";
  String especialidades = "";

  String beneficioEmergencial = "";
  String emprestimo = "";

  String funcDemitidoPandemia = "";

  String percentualMensal = "";

  String filiais = "";
  bool parteFranquia = null;
  String encerrarForcenecedor = "";

  @override
  Widget build(BuildContext context) {
    botaoRegister() {
      setState(() {
        botaoDisable = !botaoDisable;
      });
    }

    clearField() {}

    alertSucess() {
      setState(() =>
          {alertRegister = "Registrado com sucesso!!!", invalidPass = false});
    }

    List<CheckBoxModel> itens = [
      CheckBoxModel(texto: "Contabilidade"),
      CheckBoxModel(texto: "E-commerce"),
      CheckBoxModel(texto: "Financeiro"),
      CheckBoxModel(texto: "Logística/Distribuição"),
      CheckBoxModel(texto: "Marketing/Publicidade e Propaganda"),
      CheckBoxModel(texto: "Marketing digital"),
      CheckBoxModel(texto: "Produção"),
      CheckBoxModel(texto: "Qualidade"),
      CheckBoxModel(texto: "Recursos Humanos"),
      CheckBoxModel(texto: "Jurídica"),
      CheckBoxModel(texto: "Desenvolvimento de Produto/Design"),
      CheckBoxModel(texto: "Tecnologia da Informação (TI)"),
      CheckBoxModel(texto: "Gastronomia"),
      CheckBoxModel(texto: "Moda"),
      CheckBoxModel(texto: "Outros")
    ];
    void listarApenasMarcados() {
      List<CheckBoxModel> itensMarcados =
          List.from(itens.where((item) => item.checked));
      especialidades = "";
      itensMarcados.forEach((item) {
        especialidades += item.texto + ", ";
      });

      print(especialidades);
    }

    alertDenied() {
      setState(() => {
            alertRegister = "Senha e confirma senha diferentes!!!",
            invalidPass = true
          });
    }

    handleRegister() async {
      botaoRegister();
      listarApenasMarcados();
      print(globals.id);

      var url =
          "https://estimulo-2020.herokuapp.com/userEstimulo/" + globals.id;

      Map<String, String> headers = {"Content-type": "application/json"};
      final body = jsonEncode({
        "razaoSocial": razaoSocialController.text,
        "cnpj": cnpjController.text,
        "enderecoComercial": enderecoComercialController.text,
        "municipio": municipoController.text,
        "estado": estadoController.text,
        "telefoneComercial": telefoneComercialController.text,
        "negocioFamiliar": negocioFamiliar,
        "faixaFaturamento": faturamento,
        "setorAtuacao": setorEmpresa,
        "segmentacao": segmentacao,
        "especialidades": especialidades,
        "beneficiou": beneficioEmergencial,
        "emprestimo": emprestimo,
        "funcDemitidos": funcDemitidoPandemia,
        "faturamentoMensal": percentualMensal,
        "filialOperando": filiais,
        "franquia": parteFranquia,
        "contratoEncerradoFornecedor": encerrarForcenecedor,
        "isFormDone": true,
      });

      var res = await http.patch(url, headers: headers, body: body).then(
            (value) => {
              print(value.statusCode),
              if (value.statusCode == 200)
                {
                  globals.razaoSocial = razaoSocialController.text,
                  globals.telefone = municipoController.text,
                  globals.cnpj = cnpjController.text,
                  globals.endereco = enderecoComercialController.text,
                  globals.municipio = municipoController.text,
                  globals.estado = estadoController.text,
                  clearField(),
                  alertSucess(),
                  print("enviando"),
                  globals.isFormDone = true,
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Router()),
                      (Route<dynamic> route) => false),
                }
              else
                {
                  print("errou"),
                  clearField(),
                }
            },
          );
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
                  "Dados da Empresa",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                Text(""),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Após o preenchimento do formulário abaixo, analisaremos a sua situação e entraremos em contato. Em caso de sua aprovação, um novo recurso será liberado, o de Consultoria.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: razaoSocialController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite uma razão social valida!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Razão Social",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        TextFormField(
                          controller: cnpjController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "CNPJ",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        TextFormField(
                          controller: idadeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Idade da empresa",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "O negócio é familiar?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: negocioFamiliar,
                                    onChanged: (value) {
                                      setState(() {
                                        negocioFamiliar = value;
                                        print(negocioFamiliar);
                                      });
                                    },
                                  ),
                                  Text('Sim'),
                                  Radio(
                                    value: false,
                                    groupValue: negocioFamiliar,
                                    onChanged: (value) {
                                      setState(() {
                                        negocioFamiliar = value;
                                        print(negocioFamiliar);
                                      });
                                    },
                                  ),
                                  Text('Não'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: enderecoComercialController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Endereço Comercial",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        TextFormField(
                          controller: municipoController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Municipo",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        TextFormField(
                          controller: estadoController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Estado",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        TextFormField(
                          controller: telefoneComercialController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Telefone Comercial",
                              icon: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                              )),
                        ),
                        TextFormField(
                          controller: numeroFuncionarioController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preenchimento obrigatório!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Nº de funcionários antes de crise:",
                            icon: Padding(
                              padding: EdgeInsets.only(top: 15.0),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Faixa de faturamento mensal antes da crise:",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text("RS30mil à RS90mil"),
                                    leading: Radio(
                                        value: "30 a 90",
                                        groupValue: faturamento,
                                        onChanged: (value) {
                                          setState(() {
                                            faturamento = value;
                                            print(faturamento);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("RS90mil à RS150mil"),
                                    leading: Radio(
                                        value: "90 a 150",
                                        groupValue: faturamento,
                                        onChanged: (value) {
                                          setState(() {
                                            faturamento = value;
                                            print(faturamento);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("RS150mil à RS210mil"),
                                    leading: Radio(
                                        value: "150 a 210",
                                        groupValue: faturamento,
                                        onChanged: (value) {
                                          setState(() {
                                            faturamento = value;
                                            print(faturamento);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("RS210mil à RS270mil"),
                                    leading: Radio(
                                        value: "210 a 270",
                                        groupValue: faturamento,
                                        onChanged: (value) {
                                          setState(() {
                                            faturamento = value;
                                            print(faturamento);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Acima de RS270mil"),
                                    leading: Radio(
                                        value: "Acima 270",
                                        groupValue: faturamento,
                                        onChanged: (value) {
                                          setState(() {
                                            faturamento = value;
                                            print(faturamento);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Qual é o setor de atuação da empresa?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text("Varejo"),
                                    leading: Radio(
                                        value: "Varejo",
                                        groupValue: setorEmpresa,
                                        onChanged: (value) {
                                          setState(() {
                                            setorEmpresa = value;
                                            print(setorEmpresa);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Atacado"),
                                    leading: Radio(
                                        value: "Atacado",
                                        groupValue: setorEmpresa,
                                        onChanged: (value) {
                                          setState(() {
                                            setorEmpresa = value;
                                            print(setorEmpresa);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Indústria"),
                                    leading: Radio(
                                        value: "Industria",
                                        groupValue: setorEmpresa,
                                        onChanged: (value) {
                                          setState(() {
                                            setorEmpresa = value;
                                            print(setorEmpresa);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Serviço"),
                                    leading: Radio(
                                        value: "Serviço",
                                        groupValue: setorEmpresa,
                                        onChanged: (value) {
                                          setState(() {
                                            setorEmpresa = value;
                                            print(setorEmpresa);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Qual é a segmentação de nicho de mercado da empresa?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text("Alimentação"),
                                    leading: Radio(
                                        value: "Alimentação",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Beleza"),
                                    leading: Radio(
                                        value: "Beleza",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Brinquedos"),
                                    leading: Radio(
                                        value: "Brinquedos",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Educação"),
                                    leading: Radio(
                                        value: "Educação",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Esportes"),
                                    leading: Radio(
                                        value: "Esportes",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Livraria"),
                                    leading: Radio(
                                        value: "Livraria",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Mercados e/ou Merceria"),
                                    leading: Radio(
                                        value: "Mercados e/ou Merceria",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Moda"),
                                    leading: Radio(
                                        value: "Moda",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Papelaria"),
                                    leading: Radio(
                                        value: "Papelaria",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Produtos para animais"),
                                    leading: Radio(
                                        value: "Produtos para animais",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Produtos para artesanato"),
                                    leading: Radio(
                                        value: "Produtos para artesanato",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Saúde"),
                                    leading: Radio(
                                        value: "Saúde",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Terceira idade"),
                                    leading: Radio(
                                        value: "Terceira idade",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Outros"),
                                    leading: Radio(
                                        value: "Outros",
                                        groupValue: segmentacao,
                                        onChanged: (value) {
                                          setState(() {
                                            segmentacao = value;
                                            print(segmentacao);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Marque a(s) especialidade(s) que você acredita necessitar de assessoria. É possível marcar mais de uma opção:",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 500.0,
                          child: ListView.builder(
                            itemCount: itens.length,
                            itemBuilder: (_, int index) {
                              return CheckboxWidget(item: itens[index]);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "A sua empresa se beneficiou do programa emergencial de manutenção do emprego (Medida Provisória 936)? *",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text("Sim"),
                                    leading: Radio(
                                        value: "Sim",
                                        groupValue: beneficioEmergencial,
                                        onChanged: (value) {
                                          setState(() {
                                            beneficioEmergencial = value;
                                            print(beneficioEmergencial);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Não"),
                                    leading: Radio(
                                        value: "Não",
                                        groupValue: beneficioEmergencial,
                                        onChanged: (value) {
                                          setState(() {
                                            beneficioEmergencial = value;
                                            print(beneficioEmergencial);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Não tenho conhecimento"),
                                    leading: Radio(
                                        value: "Não tenho conhecimento",
                                        groupValue: beneficioEmergencial,
                                        onChanged: (value) {
                                          setState(() {
                                            beneficioEmergencial = value;
                                            print(beneficioEmergencial);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "A empresa recebeu algum empréstimo dos fundos públicos destinados ao socorro de pequenas e médias empresas afetadas pela Covid-19? (Exemplo: Programa Nacional de Apoio às Microempresas e Empresas de Pequeno Porte (Pronampe), Programa Emergencial de Suporte ao Emprego (Pese), Programa de Capital de Giro para Preservação de Empresa (CGPE), dentre outras).",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text("Sim"),
                                    leading: Radio(
                                        value: "Sim",
                                        groupValue: emprestimo,
                                        onChanged: (value) {
                                          setState(() {
                                            emprestimo = value;
                                            print(emprestimo);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Não"),
                                    leading: Radio(
                                        value: "Não",
                                        groupValue: emprestimo,
                                        onChanged: (value) {
                                          setState(() {
                                            emprestimo = value;
                                            print(emprestimo);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Não tenho conhecimento"),
                                    leading: Radio(
                                        value: "Não tenho conhecimento",
                                        groupValue: emprestimo,
                                        onChanged: (value) {
                                          setState(() {
                                            emprestimo = value;
                                            print(emprestimo);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Durante a pandemia, quantos funcionários você demitiu?",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("1 a 3"),
                                    leading: Radio(
                                        value: "1 a 3",
                                        groupValue: funcDemitidoPandemia,
                                        onChanged: (value) {
                                          setState(() {
                                            funcDemitidoPandemia = value;
                                            print(funcDemitidoPandemia);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("4 a 6"),
                                    leading: Radio(
                                        value: "4 a 6",
                                        groupValue: funcDemitidoPandemia,
                                        onChanged: (value) {
                                          setState(() {
                                            funcDemitidoPandemia = value;
                                            print(funcDemitidoPandemia);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("7 a 9"),
                                    leading: Radio(
                                        value: "7 a 9",
                                        groupValue: funcDemitidoPandemia,
                                        onChanged: (value) {
                                          setState(() {
                                            funcDemitidoPandemia = value;
                                            print(funcDemitidoPandemia);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Mais de 10"),
                                    leading: Radio(
                                        value: "Mais de 10",
                                        groupValue: funcDemitidoPandemia,
                                        onChanged: (value) {
                                          setState(() {
                                            funcDemitidoPandemia = value;
                                            print(funcDemitidoPandemia);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title:
                                        Text("Nenhuma demissão foi realizada."),
                                    leading: Radio(
                                        value:
                                            "Nenhuma demissão foi realizada.",
                                        groupValue: funcDemitidoPandemia,
                                        onChanged: (value) {
                                          setState(() {
                                            funcDemitidoPandemia = value;
                                            print(funcDemitidoPandemia);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Durante a pandemia, qual foi o percentual de redução de seu faturamento mensal?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title:
                                        Text("O faturamento não teve redução"),
                                    leading: Radio(
                                        value: "O faturamento não teve redução",
                                        groupValue: percentualMensal,
                                        onChanged: (value) {
                                          setState(() {
                                            percentualMensal = value;
                                            print(percentualMensal);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("1% a 20%"),
                                    leading: Radio(
                                        value: "1% a 20%",
                                        groupValue: percentualMensal,
                                        onChanged: (value) {
                                          setState(() {
                                            percentualMensal = value;
                                            print(percentualMensal);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("21% a 40%"),
                                    leading: Radio(
                                        value: "21% a 40%",
                                        groupValue: percentualMensal,
                                        onChanged: (value) {
                                          setState(() {
                                            percentualMensal = value;
                                            print(percentualMensal);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("41% a 60%"),
                                    leading: Radio(
                                        value: "41% a 60%",
                                        groupValue: percentualMensal,
                                        onChanged: (value) {
                                          setState(() {
                                            percentualMensal = value;
                                            print(percentualMensal);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Mais de 60%"),
                                    leading: Radio(
                                        value: "Mais de 60%",
                                        groupValue: percentualMensal,
                                        onChanged: (value) {
                                          setState(() {
                                            percentualMensal = value;
                                            print(percentualMensal);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Não tenho essa informação."),
                                    leading: Radio(
                                        value: "Não tenho essa informação.",
                                        groupValue: percentualMensal,
                                        onChanged: (value) {
                                          setState(() {
                                            percentualMensal = value;
                                            print(percentualMensal);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Se respondeu sim a pergunta anterior, a franquia concedeu algum apoio durante a pandemia?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text("Não"),
                                    leading: Radio(
                                        value: "Não",
                                        groupValue: filiais,
                                        onChanged: (value) {
                                          setState(() {
                                            filiais = value;
                                            print(filiais);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("1"),
                                    leading: Radio(
                                        value: "1",
                                        groupValue: filiais,
                                        onChanged: (value) {
                                          setState(() {
                                            filiais = value;
                                            print(filiais);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("2"),
                                    leading: Radio(
                                        value: "2",
                                        groupValue: filiais,
                                        onChanged: (value) {
                                          setState(() {
                                            filiais = value;
                                            print(filiais);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Mais de 2"),
                                    leading: Radio(
                                        value: "Mais de 2",
                                        groupValue: filiais,
                                        onChanged: (value) {
                                          setState(() {
                                            filiais = value;
                                            print(filiais);
                                          });
                                        }),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "A empresa faz parte de uma Franquia?",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("Sim"),
                                    leading: Radio(
                                        value: true,
                                        groupValue: parteFranquia,
                                        onChanged: (value) {
                                          setState(() {
                                            parteFranquia = value;
                                            print(parteFranquia);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Não"),
                                    leading: Radio(
                                        value: false,
                                        groupValue: parteFranquia,
                                        onChanged: (value) {
                                          setState(() {
                                            parteFranquia = value;
                                            print(parteFranquia);
                                          });
                                        }),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Durante a pandemia, você precisou encerrar contrato com quantos fornecedores?",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("Nenhum"),
                                    leading: Radio(
                                        value: "Nenhum",
                                        groupValue: encerrarForcenecedor,
                                        onChanged: (value) {
                                          setState(() {
                                            encerrarForcenecedor = value;
                                            print(encerrarForcenecedor);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("1 a 2"),
                                    leading: Radio(
                                        value: "1 a 2",
                                        groupValue: encerrarForcenecedor,
                                        onChanged: (value) {
                                          setState(() {
                                            encerrarForcenecedor = value;
                                            print(encerrarForcenecedor);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("3 a 4"),
                                    leading: Radio(
                                        value: "3 a 4",
                                        groupValue: encerrarForcenecedor,
                                        onChanged: (value) {
                                          setState(() {
                                            encerrarForcenecedor = value;
                                            print(encerrarForcenecedor);
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text("Mais de 4"),
                                    leading: Radio(
                                        value: "Mais de 4",
                                        groupValue: encerrarForcenecedor,
                                        onChanged: (value) {
                                          setState(() {
                                            encerrarForcenecedor = value;
                                            print(encerrarForcenecedor);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                              "Finalizar Cadastro",
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
        ),
      ),
    );
  }
}

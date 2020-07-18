import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/tarefa.dart';

void main() {
  runApp(new ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller = new TextEditingController();

  void adicionarTarefa(String nome) {
    setState(() {
      tarefas.add(new Tarefa(nome));
    });

    controller.clear();
  }

  Widget getIten(Tarefa tarefa) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: new Icon(
              tarefa.concluida
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.green),
          iconSize: 42.0,
          onPressed: () {
            setState(() {
              tarefa.concluida = !tarefa.concluida;
            });
          },
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tarefa.nome,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            Text(tarefa.data.toIso8601String())
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Lista de Tarefas")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                adicionarTarefa(value);
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (_, indice) {
                    return getIten(tarefas[indice]);
                  }))
        ],
      ),
    );
  }
}

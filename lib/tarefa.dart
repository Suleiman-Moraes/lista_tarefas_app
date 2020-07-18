class Tarefa {
  String nome;
  DateTime data;
  bool concluida;

  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }
}

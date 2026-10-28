// Contrato e modelos do benchmark. Idêntico nos dois projetos.

import 'dart:async';

class Etapa {
  const Etapa(this.nome, this.duracao);

  final String nome;
  final Duration duracao;
}

class Resultado {
  Resultado(this.operacao);

  final String operacao;
  final List<Etapa> etapas = [];

  /// Contagens e somas de conferência (devem bater entre os bancos).
  final Map<String, String> detalhes = {};

  /// Tempo do clique no botão até a ação terminar (medido pela tela).
  Duration? tempoClique;

  Duration get total =>
      etapas.fold(Duration.zero, (soma, etapa) => soma + etapa.duracao);

  Future<T> medir<T>(String nome, FutureOr<T> Function() acao) async {
    final cronometro = Stopwatch()..start();
    final retorno = await acao();
    cronometro.stop();
    etapas.add(Etapa(nome, cronometro.elapsed));
    return retorno;
  }
}

abstract class BenchmarkRepository {
  String get nome;

  Future<void> abrir();

  Future<void> fechar();

  /// Insere 500 produtos com códigos de barras e impostos, busca todos
  /// os inseridos e grava 100 vendas calculadas a partir deles.
  Future<Resultado> inserir();

  /// Lê tudo: produtos (com códigos e imposto) e vendas (com itens).
  Future<Resultado> buscar();

  /// Apaga todos os registros de todas as entidades.
  Future<Resultado> deletar();
}

// Tela única do benchmark. Idêntica nos dois projetos.

import 'package:flutter/material.dart';

import '../benchmark/benchmark.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.repository});

  final BenchmarkRepository repository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Resultado> _resultados = [];
  bool _executando = false;

  Future<void> _executar(Future<Resultado> Function() operacao) async {
    final cronometro = Stopwatch()..start();
    setState(() => _executando = true);
    try {
      final resultado = await operacao();
      cronometro.stop();
      resultado.tempoClique = cronometro.elapsed;
      setState(() => _resultados.insert(0, resultado));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    } finally {
      if (mounted) setState(() => _executando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final repo = widget.repository;
    return Scaffold(
      appBar: AppBar(
        title: Text('Benchmark — ${repo.nome}'),
        actions: [
          IconButton(
            tooltip: 'Limpar histórico',
            icon: const Icon(Icons.clear_all),
            onPressed: _resultados.isEmpty
                ? null
                : () => setState(_resultados.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: _executando ? null : () => _executar(repo.inserir),
                  icon: const Icon(Icons.add),
                  label: const Text('Insert'),
                ),
                FilledButton.tonalIcon(
                  onPressed: _executando ? null : () => _executar(repo.buscar),
                  icon: const Icon(Icons.search),
                  label: const Text('Get'),
                ),
                OutlinedButton.icon(
                  onPressed: _executando ? null : () => _executar(repo.deletar),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                ),
              ],
            ),
          ),
          if (_executando) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _resultados.length,
              itemBuilder: (_, i) => _ResultadoCard(_resultados[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultadoCard extends StatelessWidget {
  const _ResultadoCard(this.resultado);

  final Resultado resultado;

  String _ms(Duration d) => '${(d.inMicroseconds / 1000).toStringAsFixed(2)} ms';

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(resultado.operacao, style: tema.titleMedium),
                ),
                if (resultado.tempoClique != null)
                  Text(
                    'Clique → fim: ${_ms(resultado.tempoClique!)}',
                    style: tema.titleMedium,
                  ),
              ],
            ),
            const Divider(),
            for (final etapa in resultado.etapas)
              Row(
                children: [
                  Expanded(child: Text(etapa.nome)),
                  Text(_ms(etapa.duracao)),
                ],
              ),
            Row(
              children: [
                Expanded(
                  child: Text('Soma das etapas', style: tema.labelLarge),
                ),
                Text(_ms(resultado.total), style: tema.labelLarge),
              ],
            ),
            if (resultado.detalhes.isNotEmpty) ...[
              const SizedBox(height: 8),
              for (final MapEntry(:key, :value) in resultado.detalhes.entries)
                Text('$key: $value', style: tema.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}

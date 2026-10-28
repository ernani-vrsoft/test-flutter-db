# Flutter DB Benchmark — ObjectBox vs SQLite (drift)

Dois apps Flutter idênticos que executam a mesma carga em bancos diferentes,
para comparar desempenho:

| Pasta | Banco |
|---|---|
| [`flutter-object-box/`](flutter-object-box) | ObjectBox 5.3.2 |
| [`flutter-sq-lite/`](flutter-sq-lite) | SQLite via drift 2.35 (ORM, migrations) |

Os arquivos em `lib/seed/`, `lib/benchmark/` e `lib/ui/` são **iguais nos dois
projetos**; só `lib/db/` muda.

## O que cada botão faz

| Botão | Ação |
|---|---|
| **Insert** | Insere 500 produtos, 1.000 códigos de barras (EAN-13) e 500 impostos → busca todos os produtos inseridos → calcula e grava 100 vendas (300 itens, produtos distintos) |
| **Get** | Lê tudo: produtos com códigos e imposto, vendas com itens |
| **Delete** | Apaga todos os registros de todas as entidades |

Entidades: `Produto`, `CodigoBarras`, `Imposto`, `Venda`, `VendaItem`.

Os dados são **determinísticos** (sempre os mesmos), então os dois bancos
gravam exatamente o mesmo conteúdo. A soma de conferência das vendas é
**38694.24** nos dois.

Cálculo da venda: ICMS, PIS e COFINS "por dentro" (inclusos no preço), IPI
"por fora" (somado ao total); arredondamento de 2 casas por item.

## Resultados — média de 5 execuções

Tempo **clique → fim** (ms), incluindo as contagens de conferência:

| Operação | ObjectBox | SQLite (drift) | Mais rápido |
|---|---:|---:|---|
| **Insert** | **7.26** | 21.80 | ObjectBox (~3,0×) |
| **Get** | 3.54 | **2.42** | SQLite (~1,5×) |
| **Delete** | **1.65** | 5.83 | ObjectBox (~3,5×) |

### Detalhe por etapa (média · mín · máx, ms)

| Operação | Etapa | ObjectBox | SQLite (drift) |
|---|---|---:|---:|
| Insert | Inserir 500 produtos + códigos + impostos | 3.40 · 2.72 · 4.29 | 12.82 · 11.28 · 16.95 |
| Insert | Buscar produtos inseridos | 1.51 · 0.91 · 2.23 | 1.05 · 0.95 · 1.30 |
| Insert | Calcular e gravar 100 vendas | 1.78 · 1.36 · 2.27 | 7.49 · 6.37 · 8.27 |
| Get | Buscar produtos + códigos + impostos | 3.03 · 2.13 · 4.48 | 1.60 · 1.40 · 1.95 |
| Get | Buscar vendas + itens | 0.50 · 0.39 · 0.59 | 0.80 · 0.66 · 1.04 |
| Delete | Apagar todas as entidades | 1.64 · 1.49 · 1.86 | 5.76 · 5.17 · 6.16 |

**Resumo:** o ObjectBox foi bem mais rápido na escrita (insert/delete). Na
leitura completa, o SQLite levou vantagem: um `JOIN` traz produto e imposto
de uma vez, enquanto no ObjectBox as relações (`ToOne`/`ToMany`) são
carregadas sob demanda, objeto a objeto.

### Ambiente e metodologia

- Intel Core i7-1255U, 38 GB RAM, NVMe (ext4), Ubuntu 24.04, Linux desktop.
- Flutter 3.44.9 (Dart 3.12.2), build **release**.
- 5 ciclos seguidos de *Insert → Get → Delete* no mesmo processo, começando
  com a base vazia; todos os ciclos entram na média (sem aquecimento).
- Os dois bancos rodam na mesma isolate da UI (o drift foi aberto com
  `NativeDatabase` em vez da isolate de background padrão do `drift_flutter`).
- Tudo em transação nos dois bancos. Diferença de padrão: o ObjectBox grava
  listas com `putMany`; no drift, impostos/produtos/vendas são inseridos um a
  um (cada um precisa do id gerado para o registro filho) e códigos/itens em
  `batch`.

São números de uma única máquina e de uma carga pequena; servem como
comparação relativa, não como valor absoluto.

## Rodando localmente

```bash
cd flutter-object-box   # ou flutter-sq-lite
flutter pub get
flutter run -d linux --release   # ou -d windows
```

Ao alterar entidades/tabelas, regenere o código:

```bash
dart run build_runner build --delete-conflicting-outputs
```

No drift, incremente `schemaVersion` em `lib/db/database.dart` e trate a
mudança em `onUpgrade`.

## Executáveis (pipeline)

O workflow [`.github/workflows/release.yml`](.github/workflows/release.yml)
compila os dois apps para **Linux** e **Windows**:

- **Push de tag** `vX.Y.Z` → compila e publica os 4 `.zip` em uma GitHub
  Release.
- **Execução manual** (*Run workflow*) → compila e deixa os `.zip` como
  artefatos da execução, sem criar release.

```bash
git tag v1.0.0 && git push origin v1.0.0
```

Os pacotes são autocontidos — não é preciso instalar Flutter, ObjectBox nem
SQLite:

- **Windows:** descompacte e rode o `.exe`. O runtime do Visual C++ já vai
  junto no zip.
- **Linux:** descompacte e rode `./flutter_object_box` ou `./flutter_sq_lite`.
  Requer apenas GTK 3 (presente em qualquer desktop) e glibc compatível com o
  runner `ubuntu-latest`.

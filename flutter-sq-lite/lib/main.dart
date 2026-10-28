import 'package:flutter/material.dart';

import 'db/sqlite_repository.dart';
import 'ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = SqliteRepository();
  await repository.abrir();
  runApp(App(repository: repository));
}

class App extends StatelessWidget {
  const App({super.key, required this.repository});

  final SqliteRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: HomePage(repository: repository),
    );
  }
}

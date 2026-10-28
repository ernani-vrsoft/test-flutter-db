import 'package:flutter/material.dart';

import 'db/objectbox_repository.dart';
import 'ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = ObjectBoxRepository();
  await repository.abrir();
  runApp(App(repository: repository));
}

class App extends StatelessWidget {
  const App({super.key, required this.repository});

  final ObjectBoxRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ObjectBox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: HomePage(repository: repository),
    );
  }
}

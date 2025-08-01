import 'package:flutter/material.dart';
import 'package:my_app/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'router/index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'App',
    );
  }
}

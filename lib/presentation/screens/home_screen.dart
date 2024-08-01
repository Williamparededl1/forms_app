import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de Estado'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestor de Estado Bloc'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.push('/bloc'),
          ),
        ],
      ),
    );
  }
}

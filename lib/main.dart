import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita el letrero DEBUG
      title: 'Welcome to Flutter', // Título de la app
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'), // Título superior
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(
          child: Text(
            'Hello World', // Texto centrado
            style: TextStyle(
              fontSize: 28, // Tamaño del texto
              fontWeight: FontWeight.bold, // Texto en negritas
              color: Colors.black87, // Color del texto
            ),
          ),
        ),
      ),
    );
  }
}

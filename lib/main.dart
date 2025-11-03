import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          SizedBox.expand(
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Contenido sobre la imagen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.movie, size: 80, color: Colors.white), // 👈 Blanco

                SizedBox(height: 20),

                Text(
                  "Welcome to Movies App",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 👈 Blanco
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Hello World",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white, // 👈 Blanco
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

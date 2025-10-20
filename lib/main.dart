import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LDSW 3.4 Utilización de Widgets',
      home: Scaffold(
        appBar: AppBar(title: Text('LDSW 3.4 Utilización de Widgets')),
        body: Center(
          // Column organiza los widgets en forma vertical
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text widget
              Text(
                'Bienvenido a MOVIES APP',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // Row widget
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.movie, color: Colors.blue, size: 40),
                  SizedBox(width: 10),
                  Text('Catálogo de Películas', style: TextStyle(fontSize: 18)),
                ],
              ),

              SizedBox(height: 30),

              // Stack widget (superpone elementos)
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.lightBlueAccent,
                  ),
                  Text(
                    'Stack Widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Container widget con diseño
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Este es un Container con bordes redondeados',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

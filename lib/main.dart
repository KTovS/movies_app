import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Poke Catalog",
      home: const PokeHomeScreen(),
    );
  }
}

class PokeHomeScreen extends StatefulWidget {
  const PokeHomeScreen({super.key});

  @override
  State<PokeHomeScreen> createState() => _PokeHomeScreenState();
}

class _PokeHomeScreenState extends State<PokeHomeScreen> {
  Map<String, dynamic>? pokemonData;
  bool isLoading = false;
  String? errorMessage;

  // Lista de pokémon para elegir aleatoriamente
  final List<String> pokemons = [
    'pikachu',
    'charmander',
    'bulbasaur',
    'squirtle',
    'jigglypuff',
    'meowth',
    'psyduck',
  ];

  Future<void> fetchPokemon() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    // Elegir un Pokémon aleatorio
    pokemons.shuffle();
    final String selected = pokemons.first;

    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$selected');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          pokemonData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Error ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "No se pudieron cargar los datos";
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemon(); // carga inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poke Catalog"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : errorMessage != null
            ? Text(errorMessage!)
            : pokemonData == null
            ? const Text("Sin datos")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    pokemonData!['sprites']['front_default'],
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    pokemonData!['name'].toString().toUpperCase(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("ID: ${pokemonData!['id']}"),
                  Text("Altura: ${pokemonData!['height']}"),
                  Text("Peso: ${pokemonData!['weight']}"),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: fetchPokemon,
                    child: const Text("🔁 Cargar otro Pokémon"),
                  ),
                ],
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MonBouton doit être ici, au même niveau que MyApp
class MonBouton extends StatelessWidget {
  // Propriétés
  final String text; // "final" devant car les valeurs ne changeront pas après la création du bouton
  final Color couleur; // same
  final double taille;

  // Constructeur
  const MonBouton({super.key, required this.text, required this.couleur, required this.taille});

  // Build
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: taille,
      height: taille / 2,
      child: ElevatedButton(
        onPressed: () {
          print("Bouton cliqué !");
        },
        child: Text(text), // C'est comme dire : "Mon bouton a un enfant (child:)" "Qui est un texte (Text)" "Avec le contenu de ma propriété text"
        style: ElevatedButton.styleFrom( // C'est comme dire : "Mon bouton a un style (style:)" "Créé à partir de (styleFrom)" "Avec un fond de ma couleur personnalisée" "Et un texte en blanc"
          backgroundColor: couleur,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )
        )
      ),
    );
  }
}

class MonTexte extends StatelessWidget {
  // Propriétés
  final double taille;
  final Color couleur;
  final String text;

  // Constructeur
  const MonTexte({super.key, required this.taille, required this.couleur, required this.text});

  // Build
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: taille,
        color: couleur,
      )
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mon App Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Pour centrer verticalement
            children: [
              MonBouton(
                text: "Mon bouton",
                couleur: Colors.green,
                taille: 200,
              ),
              MonTexte(
                text: "Bienvenue sur ma super application !",
                couleur: Colors.purple,
                taille: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
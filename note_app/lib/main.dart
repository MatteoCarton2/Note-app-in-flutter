import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ex 1 :
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
// ex 2 :
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

// ex 3
class CarteProfil extends StatelessWidget {
  // Propriétés
  final IconData icone;
  final String nom;
  final String titre;
  final String description;

  // Constructeur
  const CarteProfil({super.key, required this.icone, required this.nom, required this.titre, required this.description});

  // Build
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        children: [
          Icon(icone),
          MonTexte(text: nom, couleur: Colors.black, taille: 16),
          MonTexte(text: titre, couleur: Colors.red, taille: 14),
          MonTexte(text: description, couleur: Colors.grey, taille: 10),
        ],
      ),
      ),
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
                couleur: Colors.blue,
                taille: 150,
              ),
              SizedBox(height: 20),
              MonTexte(
                text: "Bienvenue sur ma super application !",
                couleur: Colors.purple,
                taille: 18,
              ),
              MonTexte(
                text: "c'est génial...",
                couleur: Colors.black,
                taille: 12,
              ),
              SizedBox(height: 20),
              CarteProfil(
                icone: Icons.person,
                nom: "Mattéo Carton",
                titre: "Développeur flutter",
                description: "En cours d'apprentissage."
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ex 1 :
class MonBouton extends StatelessWidget {
  // Propriétés
  final String text; // "final" devant car les valeurs ne changeront pas après la création du bouton
  final Color couleur; // same
  final double size;

  // Constructeur
  const MonBouton({super.key, required this.text, required this.couleur, required this.size});

  // Build
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size / 2,
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
  final double size;
  final Color couleur;
  final String text;

  // Constructeur
  const MonTexte({super.key, required this.size, required this.couleur, required this.text});

  // Build
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
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
          MonTexte(text: nom, couleur: Colors.black, size: 16),
          MonTexte(text: titre, couleur: Colors.red, size: 14),
          MonTexte(text: description, couleur: Colors.grey, size: 10),
        ],
      ),
      ),
    );
  }
}

// ex 04
class ListeTaches extends StatelessWidget {
  // propriétés
  final String text;
  final bool done;
  final Function(bool?) onChanged;
  final Function() onDelete;

  // constructeur
  const ListeTaches({super.key, required this.text, required this.done, required this.onChanged, required this.onDelete});

  // build
@override
Widget build(BuildContext context) {
  return ListTile(
    leading: Checkbox(
      value: done,
      onChanged: onChanged,
      ),
    title: MonTexte(text: text, couleur: Colors.black, size: 14),
    trailing: IconButton(
      icon: Icon(Icons.delete),
      onPressed: onDelete,
      color: Colors.red,
    ),
  );
}
}

// ex 05

class MonImage extends StatelessWidget {
  // propriétés
  final String url;
  final double size;
  final Color shadowColor;
  final double sizeBorder;

  // constructeur
  const MonImage({super.key, required this.url, required this.size, required this.shadowColor, required this.sizeBorder});

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(sizeBorder),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          ),
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
              MonImage(
                url: "https://wallpapercave.com/wp/wp7707788.jpg",
                size: 200,
                shadowColor: Colors.black,
                sizeBorder: 4,
              ),
              SizedBox(height: 32),
              CarteProfil(
                icone: Icons.person,
                nom: "Mattéo Carton",
                titre: "Développeur flutter",
                description: "En cours d'apprentissage."
              ),
              SizedBox(height: 32),
              ListeTaches(
                text: "Apprendre Flutter",
                done: false,
                onChanged: (bool? value) {
                  print("La tâche 'Apprendre Flutter' est désormais : $value");
                },
                onDelete: () {
                  print("La tâche 'Apprendre Flutter' a été supprimée.");
                },
              ),
               ListeTaches(
                text: "Créer ma propre application",
                done: false,
                onChanged: (bool? value) {
                  print("La tâche 'Créer ma propre application' est désormais : $value");
                },
                onDelete: () {
                  print("La tâche 'Créer ma propre application' a été supprimée.");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
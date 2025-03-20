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

// ex 06

class MonFormulaire extends StatefulWidget {
  // propriétés
  final Function (String nom, String email) onSubmit;
  final Color couleur;
  final double borderSize;

  // constructeur
  const MonFormulaire({super.key, required this.onSubmit, required this.couleur, required this.borderSize});

  //build
  @override
  State<MonFormulaire> createState() => _MonFormulaireState();
}

class _MonFormulaireState extends State<MonFormulaire> {
  // Contrôleurs (c'est comme des "gestionnaires" qui vont suivre ce que le user tape)
  final _nomController = TextEditingController();
  final _emailController = TextEditingController();

  // Build
  @override
  Widget build (BuildContext build) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
      children: [
        TextField(
          controller: _nomController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            labelText: "Votre nom",
            hintText: "Entrez votre nom", // Le texte d'aide qui disparaît
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderSize)
            ),
            enabledBorder: OutlineInputBorder(  // Bordure quand pas sélectionné
              borderSide: BorderSide(color: widget.couleur),
              borderRadius: BorderRadius.circular(widget.borderSize),
            ),
            focusedBorder: OutlineInputBorder(  // Bordure quand sélectionné
              borderSide: BorderSide(color: widget.couleur, width: 2),
              borderRadius: BorderRadius.circular(widget.borderSize),
            ), 
          ),
        ),
        SizedBox(height: 16),
         TextField(
          controller: _emailController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            labelText: "Votre email",
            hintText: "Entrez votre email", // Le texte d'aide qui disparaît
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderSize)
            ),
            enabledBorder: OutlineInputBorder(  // Bordure quand pas sélectionné
              borderSide: BorderSide(color: widget.couleur),
              borderRadius: BorderRadius.circular(widget.borderSize),
            ),
            focusedBorder: OutlineInputBorder(  // Bordure quand sélectionné
              borderSide: BorderSide(color: widget.couleur, width: 2),
              borderRadius: BorderRadius.circular(widget.borderSize),
            ), 
          ),
        ),
        SizedBox(height: 16),
        IconButton(
          onPressed: () {
            widget.onSubmit(_nomController.text, _emailController.text);
          },
          icon: Icon(Icons.send),
          color: Colors.red,
          iconSize: 24,
        ),
      ]
    ),
    );
  }

  // Libérer les ressources (comme free en c)
  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    super.dispose(); // fait référence à la classe parente (ici State)
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
              CarteProfil(
                icone: Icons.person,
                nom: "Mattéo Carton",
                titre: "Développeur flutter",
                description: "En cours d'apprentissage."
              ),
              SizedBox(height: 32),
              MonFormulaire(
                onSubmit: (nom, email) {
                  print("Nom: $nom, Email: $email");
                },
                couleur: Colors.red,
                borderSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
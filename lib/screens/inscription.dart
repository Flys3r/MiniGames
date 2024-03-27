import 'package:flutter/material.dart';
import '../database/database.dart';

class InscriptionScreen extends StatefulWidget {
  @override
  _InscriptionScreenState createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre prénom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Adresse Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre adresse email';
                  }
                  // Validation d'email simple
                  if (!value.contains('@')) {
                    return 'Veuillez saisir une adresse email valide';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Si le formulaire est valide, enregistre l'utilisateur
                      _registerUser();
                    }
                  },
                  child: Text('S\'inscrire'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerUser() async {
    // Créer un map contenant les informations de l'utilisateur
    Map<String, dynamic> user = {
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    // Insérer l'utilisateur dans la base de données
    int result = await DatabaseHelper.instance.insertUser(user);

    if (result != 0) {
      // Afficher un message de succès si l'insertion a réussi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Utilisateur enregistré avec succès'),
        ),
      );
      // Effacer les champs du formulaire après l'inscription réussie
      _clearForm();
    } else {
      // Afficher un message d'erreur si l'insertion a échoué
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'enregistrement de l\'utilisateur'),
        ),
      );
    }
  }

  void _clearForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }
}

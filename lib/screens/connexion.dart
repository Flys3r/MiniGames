import 'package:flutter/material.dart';
import '../database/database.dart';
import '../screens/home.dart';
import '../screens/inscription.dart';

class ConnexionScreen extends StatefulWidget {
  @override
  _ConnexionScreenState createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                      _login();
                    }
                  },
                  child: Text('Se connecter'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InscriptionScreen()),
                  );
                },
                child: Text('Pas encore inscrit ? S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Vérifier les identifiants dans la base de données
    bool loggedIn = await DatabaseHelper.instance.loginUser(email, password);

    if (loggedIn) {
      // Si la connexion réussit, naviguez vers la page HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(userEmail: email, firstName: '', lastName: '')),
      );
    } else {
      // Sinon, affichez un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Adresse email ou mot de passe incorrect'),
        ),
      );
    }
  }
}

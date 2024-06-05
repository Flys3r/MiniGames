import 'package:flutter/material.dart';
import '../database/database.dart';

class EditProfilPage extends StatefulWidget {
  final String userEmail;
  final String firstName;
  final String lastName;

  EditProfilPage({
    required this.userEmail,
    required this.firstName,
    required this.lastName,
  });

  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    firstName = widget.firstName;
    lastName = widget.lastName;
    email = widget.userEmail;
  }

  Future<void> _updateUserDetails() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        Map<String, dynamic>? user = await DatabaseHelper.instance.getUserByEmail(widget.userEmail);
        if (user != null) {
          await DatabaseHelper.instance.updateUser(user['id'], {
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'password': password ?? user['password'],
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profil mis à jour avec succès'),
            ),
          );

          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Une erreur s\'est produite lors de la mise à jour du profil'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: firstName,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
                onSaved: (value) {
                  firstName = value;
                },
              ),
              TextFormField(
                initialValue: lastName,
                decoration: InputDecoration(labelText: 'Nom de famille'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom de famille';
                  }
                  return null;
                },
                onSaved: (value) {
                  lastName = value;
                },
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre adresse e-mail';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    password = value;
                  }
                },
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateUserDetails,
                child: Text('Mettre à jour le profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

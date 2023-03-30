import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterSalesPersonScreen extends StatefulWidget {
  const RegisterSalesPersonScreen({super.key});

  @override
  _RegisterSalesPersonScreenState createState() => _RegisterSalesPersonScreenState();
}

class _RegisterSalesPersonScreenState extends State<RegisterSalesPersonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final userUid=  FirebaseAuth.instance.currentUser?.uid.toString();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerSalesPerson() async {
    final adminUser = FirebaseAuth.instance.currentUser;
    if (adminUser == null) {
      // The admin user is not logged in, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please log in as admin first.')),
      );
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      // Use a secondary app to create the sales person user
      final secondaryApp = await Firebase.initializeApp(
        name: 'salesPersonApp',
        options: Firebase.app().options,
      );
      final salesPersonUserCredential = await FirebaseAuth.instanceFor(app: secondaryApp).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Delete the secondary app to ensure that the original admin user stays logged in
      await Firebase.app('salesPersonApp').delete();

      // Create the sales person document in the users collection
      await FirebaseFirestore.instance.collection('users').doc(salesPersonUserCredential.user!.uid).set({
        'usermail': email,
        'adminID': adminUser.uid,
        'isAdmin': '0',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sales person registered successfully.')),
      );
      _emailController.clear();
      _passwordController.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register sales person: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Sales Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _registerSalesPerson();
                  }
                },
                child: const Text('Register'),
              ),

              // Text user_uid to see the current user is admin or not, comment it out later!!
              Text("$userUid")
            ],
          ),
        ),
      ),
    );
  }
}

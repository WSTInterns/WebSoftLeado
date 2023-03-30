import 'package:brew_crew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/authenticate/registerSp.dart';
import '../../authenticate/handler.dart';

class adminHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _adminHome();
  }
}

class _adminHome extends State<adminHome> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Handler()));
  }

  @override
  Widget build(BuildContext context) {
    final adminUid = FirebaseAuth.instance.currentUser?.uid.toString();

    final elevatedbutton = ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RegisterSalesPersonScreen()),
          );
        },
        child: const Text('Add new sales person'));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Admin HomePage'),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                signOut();
              },
              icon: const Icon(Icons.logout_outlined),
              label: const Text('Logout'))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 25.0),
                  elevatedbutton,
                ],
              ),
            ),
          ),
          Text("$adminUid")
        ],
      ),
    );
  }
}

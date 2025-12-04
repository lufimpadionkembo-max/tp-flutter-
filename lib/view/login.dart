import 'package:course/view/Register.dart';
import 'package:flutter/material.dart';

/*class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: const Color.fromARGB(255, 230, 16, 5),
        title: Text(
          'Connexion',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //spacing 20
          children: [
            Text(
              'EMAIL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'entrer votre email',
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),

            //bouton de mot de passe
            SizedBox(height: 30),
            Text('MOT DE PASSE'),
            TextField(
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                labelText: 'mot de passe',
              ),
            ),
            SizedBox(height: 30),

            //bouton de connexion
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('email: ${_emailController.text}');
                  print('mot de passe: ${_passwordController.text}');

                  //appel de la fonction de login
                  return _doLogin(
                    _emailController.text,
                    _passwordController.text,
                  );

                  //exemple sans fonction

                  //if (_emailController.text.isEmpty &&
                  //   _passwordController.text.isEmpty) {
                  // print('Veuillez remplir tous les champs svp');
                  //} else {
                  // print('Connexion réussie');
                  //}
                },
                child: Text('SE CONNECTER'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // fonction de login
  void _doLogin(String email, String password) {
    // Simulate a login process
    if (email.isEmpty || password.isEmpty) {
      print('Veuillez remplir tous les champs svp');
    } else {
      print('Connexion réussie');
    }
  }
}*/

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulation d'un login
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Connexion réussie !")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),

              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔹 Titre
                    Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 🔹 Email
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer votre email";
                        }
                        if (!value.contains("@")) {
                          return "Email invalide";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // 🔹 Mot de passe
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer votre mot de passe";
                        }
                        if (value.length < 6) {
                          return "Minimum 6 caractères";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // 🔗 Lien vers Register
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text("Pas de compte ? Créez un compte !"),
                    ),

                    // 🔹 Bouton Login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                            : const Text(
                                "Se connecter",
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

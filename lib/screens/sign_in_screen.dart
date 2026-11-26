import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wisata_candi_drewww/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO : 1. Deklarasikan Variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  void _signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = 'Nama pengguna dan kata sandi harus diisi.';
      });
      return;
    }

    if (savedUsername.isEmpty || savedPassword.isEmpty) {
      setState(() {
        _errorText =
            'Pengguna belum terdaftar. Silakan daftar terlebih dahulu.';
      });
      return;
    }

    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      setState(() {
        _errorText = '';
        _isSignedIn = true;
      });
      await prefs.setBool('isSignedIn', true);

      if (!mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      setState(() {
        _errorText = 'Nama pengguna atau kata sandi salah.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Pasang Appbar
      appBar: AppBar(title: Text('Sign In')),
      //TODO 3: Pasang Body
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            // TODO 4. AturmainAxisAlignment dan crossAxisAlignment
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //TODO 5. PasangTextFormField Nama Pengguna
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pengguna',
                  border: OutlineInputBorder(),
                ),
              ),

              //TODO 6. Pasang TextFormField Password
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: OutlineInputBorder(),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
              //TODO 7. Pasang ElevatedButton Sign In
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
              //TODO 8. Pasang TextButton Sign Up
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                  children: [
                    TextSpan(
                      text: 'Daftar di sini.',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Aksi ketika teks "Daftar di sini" diklik
                          // Contoh: Navigator.push(...)
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

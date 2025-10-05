import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enjoy the various best courses we have, choose the category according to your wishes.",
              style: TextStyle(fontSize: 14, color: Color(0xFF697B7A)),
            ),
            const SizedBox(height: 20),

            const Text(
              "Email",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF092724),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF092724),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "New Password",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF092724),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            PasswordField(label: "New Password"),

            const SizedBox(height: 20),
            const Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF092724),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            PasswordField(label: "Confirm Password"),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text("Create Account"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Color(0xFF697B7A), fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: Color(0xFFF2C94C),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String label;
  const PasswordField({super.key, required this.label});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
      ),
    );
  }
}

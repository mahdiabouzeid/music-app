import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'tabbar.dart'; // Ensure this path is correct

String _baseURL = 'mymusicapp24.atwebpages.com';

class LoginPage extends StatefulWidget {
  final String? initialEmail;

  LoginPage({this.initialEmail});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _loading = false;



  void login(String email, String password, Function(bool, String?) update) async {
    try {
      final response = await http.post(
        Uri.http(_baseURL, 'login.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = convert.jsonDecode(response.body);
        if (data['status'] == 'success') {
          update(true, null); // Login successful
        } else {
          update(false, data['message']);
        }
      } else {
        update(false, 'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      update(false, 'An error occurred');
    }
  }

  String getEmail(){
    return '$email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                const Text(
                  'MUSIC APP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico-Regular',
                  ),
                ),
                SizedBox(height: 40.0),
                Form(
                  key: formState,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: _loading ? null : () {
                          if (formState.currentState!.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            login(
                              email.text,
                              password.text,
                                  (success, message) {
                                setState(() {
                                  _loading = false;
                                });
                                if (success) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Tabbar()), // Ensure this page is correct
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message ?? 'Login failed')),
                                  );
                                }
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                          foregroundColor: Colors.purple[800], // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      if (_loading)
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

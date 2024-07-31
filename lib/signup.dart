import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'login.dart';

String _baseURL = 'mymusicapp24.atwebpages.com';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  String? _selectedPlan;
  bool _loading = false;

  String gender = "Male";

  final List<Subscription> subscriptions = [
    Subscription("Basic", 1),
    Subscription("Premium", 2),
  ];

  void signup(String username, String email, String password, String plan, Function(bool) update) async {
    print('Signup initiated with username: $username, email: $email, plan: $plan');
    try {
      final client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final request = await client.postUrl(Uri.http(_baseURL, 'register.php'));
      request.headers.set('Content-Type', 'application/json; charset=UTF-8');
      request.add(utf8.encode(jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'planid': plan,
      })));

      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();

      print('Response status code: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 200) {
        update(true);
      } else {
        print('Error: $responseBody');
        update(false);
      }
    } catch (e) {
      print('Exception: $e');
      update(false);
    }
  }

  void update(bool success) {
    setState(() {
      _loading = false;
    });
    if (success) {
      print('Signup successful, navigating to LoginPage');
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      print('Signup failed, showing SnackBar');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Form(
          key: formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(height: 20.0),
              TextFormField(
                controller: username,
                decoration: InputDecoration(hintText: 'Username', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: password,
                decoration: InputDecoration(hintText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<int>(
                value: _selectedPlan != null ? int.tryParse(_selectedPlan!) : null,
                items: subscriptions.map((Subscription subscription) {
                  return DropdownMenuItem<int>(
                    value: subscription.id,
                    child: Text(subscription.subscription),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedPlan = newValue?.toString();
                  });
                },
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Select Plan'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a plan';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20.0),
              Text("What is Your Gender"),
              Row(
                children: [
                  Text("Male"),
                  Radio(value: "Male", groupValue: gender, onChanged: (val) {
                    setState(() {
                      gender = val!;
                    });
                  }),
                  Text("Female"),
                  Radio(value: "Female", groupValue: gender, onChanged: (val) {
                    setState(() {
                      gender = val!;
                    });
                  }),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _loading ? null : () {
                  if (formState.currentState!.validate()) {
                    setState(() {
                      _loading = true;
                    });
                    if (_selectedPlan != null) {
                      print('Form validated, calling signup...');
                      signup(username.text, email.text, password.text, _selectedPlan!, update);
                    } else {
                      print('No subscription plan selected');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a subscription plan')));
                      setState(() {
                        _loading = false;
                      });
                    }
                  }
                },
                child: Text('Signup'),
              ),
              SizedBox(height: 10),
              if (_loading) CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class Subscription {
  final String subscription;
  final int id;

  Subscription(this.subscription, this.id);

  @override
  String toString() {
    return subscription;
  }
}


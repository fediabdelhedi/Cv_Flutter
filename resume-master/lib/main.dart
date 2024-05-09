import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/cv_chayma/HomePageC.dart';
import 'package:flutter_application_2/cv_fedi/HomePageF.dart';

void main() {
  runApp(MaterialApp(
    home: InitialPage(),
  ));
}


class InitialPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter your username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text.trim();
                  String password = passwordController.text.trim();


                  // Check username and password
                  if (username == 'chayma' && password == 'chayma123') {
                    navigatorKey.currentState!.pop();
                    navigatorKey.currentState!.push(
                      MaterialPageRoute(builder: (context) => MyApp(context: context)),
                    );
                  } else if (username == 'fedi' && password == 'fedi123') {
                    navigatorKey.currentState!.pop();
                    navigatorKey.currentState!.push(
                      MaterialPageRoute(builder: (context) => MyApp1(context: context)),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error',
                          style: TextStyle(color: Colors.red)
                          ),
                          content: Text('Cet utilisateur n\'a pas de CV.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Login',
                  style: TextStyle(color: Colors.black),
              ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.grey,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

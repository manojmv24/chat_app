import 'package:chat_app_four/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool login = true;
  var email_id = "";
  var password = "";
  var formkey = GlobalKey<FormState>();

  void validateForm() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("email id:$email_id, password:$password "),
        ),
      );

      if (login) {
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            child: Image.asset('assets/images/chat.png'),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15),
              child: SingleChildScrollView(
                  child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!login) const ImageWidget(),
                          TextFormField(
                            decoration: const InputDecoration(labelText: "Email id"),
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty || !value.contains("@")) {
                                return 'enter valid email address';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              email_id = newValue!;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(labelText: "Password"),
                            autocorrect: false,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty || value.length <= 5) {
                                return 'Enter a valid password';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              password = newValue!;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              validateForm();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primaryContainer),
                            child: Text(
                              login ? "Login" : "Signup",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  login = !login;
                                });
                              },
                              child: Text(
                                login
                                    ? "Don't have an account? Signup"
                                    : "Have an account already? Login",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ))),
            ),
          )
        ]),
      )),
    );
  }
}

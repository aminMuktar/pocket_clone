import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_clone/src/ui/mylist.dart';
import '../resources/authentication.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isLoading=false;
  bool _isSigningIn=false;
  Widget _labelPlace() {
    return Column(children: <Widget>[
      Column(children: const <Widget>[
        Text(
          "Log In",
          style: TextStyle(
              fontFamily: "RobotoMono",
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ]),
    ]);
  }

  Widget _emailField() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            TextFormField(
              autofocus: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'this field is required';
                } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value!)) {
                  return 'enter a valid email address';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email address',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            TextFormField(
              autofocus: false,
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'this field is required';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                passwordController.text = value!;
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return Material(
      elevation: 5,
      color: Color(0xff0d5ee0),
      shadowColor: Color(0xff031b42),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          if(_formKey.currentState!.validate()){
            setState(() {
              _isLoading=true;
            });
          }
        },
        child: Text(
          "Log in",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // placeholder for google signin
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _labelPlace(),
                          _emailField(),
                          _passwordField(),
                          SizedBox(
                            height: 20,
                          ),
                          loginButton(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "OR",
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FutureBuilder(
                              future: Authentication.initializeFirebase(context: context),
                              builder:(context,snapshot){
                                if(snapshot.hasError){
                                  return Text("error initializing");
                                }
                                else if(snapshot.connectionState == ConnectionState.done){
                                  return Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(top: 10),
                                      child: _isSigningIn
                                          ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0d5ee0)),
                                      )
                                          : SignInButton(
                                        Buttons.Google,
                                        onPressed: () async {
                                          setState(() {
                                            _isSigningIn=true;
                                          });
                                          User? user=await Authentication().signInWithGoogle(context: context);
                                          setState(() {
                                            _isSigningIn=false;
                                          });
                                          if(user!=null){
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) => MyList(),
                                              ),
                                            );
                                          }
                                        },

                                      )
                                  );
                                }
                                return CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff780858)
                                  ),
                                );
                              }

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SignInButton(
                            Buttons.Facebook,
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SignInButton(
                            Buttons.GitHub,
                            onPressed: () {},
                          ),
                        ],
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

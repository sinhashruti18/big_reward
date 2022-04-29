import 'package:big_reward/Homepage.dart';
import 'package:big_reward/home.dart';
import 'package:big_reward/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final UserCredential user =
            await _auth.signInWithCredential(credential);
        await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

//Firebase
  final _auth = FirebaseAuth.instance;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Container(
                child: Image.asset("images/topimage2.png"),
              ),
              Container(

                
                margin: EdgeInsets.only(left: 20, right: 20, top: 60),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailcontroller.text = value!;
                  },
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // fillColor: Colors.white,
                    // filled: true,
                    errorStyle: TextStyle(color: Colors.black, fontSize: 14),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),

                    
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Please enter valid password(Min. 6 Character)");
                    }
                  },
                  onSaved: (value) {
                    passwordcontroller.text = value!;
                  },
                  obscureText: _obscureText,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),

                    errorStyle: TextStyle(color: Colors.black, fontSize: 14),
                    // filled: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  signIn(emailcontroller.text, passwordcontroller.text);
                },
                child: Container(
                    height: 50,
                    width: 150,
                    // padding: EdgeInsets.only(
                    //     left: 48, top: 25, bottom: 10, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      color: Color(0XFFED11618C),
                      // image: const DecorationImage(
                      //     image: const AssetImage("images/login.png"),
                      //     fit: BoxFit.cover)
                    ),
                    child: const Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 80,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: const AssetImage("images/line.png"))),
                  ),
                  // child: Image.asset("image/line.png")),
                  const Text("OR Login with"),
                  Container(
                    width: 90,
                    height: 80,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/line.png"))),
                  ),
                  // Image.asset("image/line.png"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    googleSignIn();
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset("images/google.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Login with Google",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: const Text(
                    "New Here?Sign Up",
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

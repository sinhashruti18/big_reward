import 'package:big_reward/Homepage.dart';
import 'package:big_reward/home.dart';
import 'package:big_reward/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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

  void signup(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = namecontroller.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false);
  }

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController confirmpasscontroller =
      new TextEditingController();
  // const ({ Key? key }) : super(key: key);
  bool _obscureText = true;
  bool _obscureText1 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset("images/topimage.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 1.1,
                    // decoration: BoxDecoration(
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Color(0XFF8D54CE),
                    //       blurRadius: 12,
                    //       offset: const Offset(0, 2),
                    //     ),
                    //   ],
                    // ),
                    // padding: EdgeInsets.on0ly(top: 150, left: 10, right: 10),
                    child: TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Name cannot be empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please enter valid name(Min. 3 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // namecontroller.text = value!;
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 14),
                        filled: true,
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),

                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(width: 3, color: Colors.red),
                        //   borderRadius: BorderRadius.circular(7),
                        // )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 70,
                    // decoration: BoxDecoration(
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Color(0XFF8D54CE),
                    //       blurRadius: 12,
                    //       offset: const Offset(0, 2),
                    //     ),
                    //   ],
                    // ),

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
                        // emailcontroller.text = value!;
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 14),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),

                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(width: 3, color: Colors.red),
                        //   borderRadius: BorderRadius.circular(7),
                        // )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 70,

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
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        fillColor: Colors.white,
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 14),
                        filled: true,
                        labelText: 'Password',
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
                    // margin: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 70,
                    // decoration: BoxDecoration(
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Color(0XFF8D54CE),
                    //       blurRadius: 12,
                    //       offset: const Offset(0, 2),
                    //     ),
                    //   ],
                    // ),

                    child: TextFormField(
                      autofocus: false,
                      obscureText: _obscureText1,
                      controller: confirmpasscontroller,
                      validator: (value) {
                        if (confirmpasscontroller.text !=
                            passwordcontroller.text) {
                          return "Pssword didn't match";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmpasscontroller.text = value!;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 14),

                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: Icon(
                            _obscureText1
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        labelText: 'Confirm Password',
                        filled: true,
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontStyle: FontStyle.normal),

                        // focusedBorder: OutlineInputBorder(
                        //   borderSide:
                        //       const BorderSide(width: 3, color: Colors.red),
                        //   borderRadius: BorderRadius.circular(7),
                        // )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      signup(emailcontroller.text, passwordcontroller.text);
                    },
                    child: Container(
                        height: 50,
                        width: 150,

                        // padding: EdgeInsets.only(
                        //     left: 48, top: 25, bottom: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff076DA8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xff076DA8)),
                          // image: DecorationImage(
                          //     image: AssetImage("images/icon.png"),
                          //     fit: BoxFit.cover)
                        ),
                        child: Center(
                          child: Text(
                            "SIGNUP",
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/line.png"))),
                      ),
                      // child: Image.asset("image/line.png")),
                      Text("OR Login with"),
                      Container(
                        width: 90,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/line.png"))),
                      ),
                      // Image.asset("image/line.png"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        googleSignIn();
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40),
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset("images/google.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Signuo with Google",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black38),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Text(
                  //   "New Here?Sign Up",
                  //   style: TextStyle(fontSize: 16, color: Colors.black),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

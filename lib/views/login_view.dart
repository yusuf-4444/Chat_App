import 'package:chat_app/contants.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/widgets/text_form_field_widget_password.dart';
import 'package:chat_app/widgets/text_form_field_widget_username.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static String id = "Login Page";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? userName;

  String? passWord;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      progressIndicator: CircularProgressIndicator(color: Colors.white),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 40),
                Image.asset("assets/images/scholar.png", height: 100),
                Center(
                  child: Text(
                    "Scolar Chat",
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 100),

                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                SizedBox(height: 15),
                CustomTextFormFieldUsername(
                  hintText: "Email",
                  onChanged: (email) {
                    userName = email;
                  },
                ),

                SizedBox(height: 15),

                CustomTextFormFieldPassword(
                  hintText: "Password",
                  onChanged: (password) {
                    passWord = password;
                  },
                ),

                SizedBox(height: 15),

                TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await SignInWithEmailAndPassword();
                        ScaffoldMessage(context, "Success");
                        isLoading = false;
                        setState(() {});
                        Navigator.pushNamed(
                          context,
                          ChatView.id,
                          arguments: userName,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessage(
                            context,
                            "No user found for that email.",
                          );
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessage(
                            context,
                            "Wrong password provided for that user.",
                          );
                        } else {
                          ScaffoldMessage(
                            context,
                            "Error!.. Please Try Again Later",
                          );
                        }
                      } catch (e) {
                        ScaffoldMessage(
                          context,
                          "Error!.. Please Try Again Later",
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error!.. Please Try Again Later"),
                        ),
                      );
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.black)),
                ),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          SignupView.id,
                          arguments: userName,
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ScaffoldMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 1), content: Text(message)),
    );
  }

  Future<void> SignInWithEmailAndPassword() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userName!,
      password: passWord!,
    );
  }
}

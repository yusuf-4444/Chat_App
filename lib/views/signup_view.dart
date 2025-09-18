import 'package:chat_app/contants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/text_form_field_widget_password.dart';
import 'package:chat_app/widgets/text_form_field_widget_username.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignupView extends StatefulWidget {
  const SignupView({super.key});
  static String id = "Register Page";

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                  "Register",
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
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: userName!,
                              password: passWord!,
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 4),
                            content: Text("Success!"),
                          ),
                        );
                        isLoading = false;
                        setState(() {});
                        Navigator.pushNamed(context, LoginView.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "The password provided is too weak.",
                              ),
                            ),
                          );
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "The account already exists for that email.",
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error!.. Please Try Again Later"),
                          ),
                        );
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
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
}

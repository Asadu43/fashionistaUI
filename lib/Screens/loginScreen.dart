import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login_ui/Screens/CreateAccountScreen.dart';
import 'package:flutter_login_ui/Screens/HomePage.dart';
import 'package:flutter_login_ui/Widgets/BoldTextWidget.dart';
import 'package:flutter_login_ui/Widgets/ButtonWidget.dart';
import 'package:flutter_login_ui/Widgets/TextFieldsWidgets.dart';
import 'package:flutter_login_ui/Widgets/TextWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  


  // void deleay(){
  //   Future.delayed(Duration(seconds: 1));
  //   if(auth.currentUser != null){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: double.infinity,
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "assets/girl.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 125.0,
                left: 0.0,
                right: 0.0,
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(50.0),

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35.0),
                          topLeft: Radius.circular(35.0)),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          FormBuilder(
                            key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    child: Text(
                                      "Welcome Fashionista ",
                                      style: GoogleFonts.bitter(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  Container(
                                    child: Text(
                                      "Sign in to continue ",
                                      style: GoogleFonts.bitter(
                                        color: Colors.black, fontSize: 20.0,),
                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFieldWidgets(
                                      "email", "enter your email", "EMAIL",
                                      Icon(Icons.email_outlined,
                                        color: Colors.black,)),
                                  SizedBox(height: 20.0,),
                                  TextFieldWidgets(
                                      "password", "enter your password",
                                      "PASSWORD",
                                      Icon(Icons.lock_outlined,
                                        color: Colors.black,)),
                                  SizedBox(height: 50.0,),

                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(
                                            20.0)
                                    ),
                                    height: 60.0,
                                    width: double.infinity,

                                    child: FlatButton(
                                      onPressed: () {

                                        if(_formKey.currentState.saveAndValidate()){

                                        }

                                      },
                                      child: Text("Sign in", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),),
                                    ),
                                  ),

                                  SizedBox(height: 30.0,),

                                  TextWidget("Forget Password?"),

                                  SizedBox(height: 30.0,),
                                  GestureDetector(child:
                                  BoldTextWidget("Sign up"),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateAccountScreen()));
                                    },),

                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}

import 'dart:ui';
import 'package:cart_and_hive/btmnbr/bottomnavigationbar_part.dart';
import 'package:cart_and_hive/pages/signupcreateaccountpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class logInPage extends StatefulWidget {
  const logInPage({super.key});

  @override
  State<logInPage> createState() => _logInPageState();
}

class _logInPageState extends State<logInPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("assets/bornonlogo.png"),
            ),
            SizedBox(
              height: 60.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone",
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 126, 119, 119),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 243, 241, 241),
                        ),
                        hintText: "Phone",
                        hintStyle: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 243, 241, 241),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                        fillColor: Color.fromARGB(255, 122, 122, 122),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 18.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "Password",
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 126, 119, 119),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 243, 241, 241),
                        ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 243, 241, 241),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                        fillColor: Color.fromARGB(255, 122, 122, 122),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 18.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                        height: 45.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color.fromARGB(255, 183, 212, 149)),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: GoogleFonts.roboto(
                                fontStyle: FontStyle.italic,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        )),
                    SizedBox(height: 30.0),
                    Row(
                      children: [
                        Text(
                          "Create a new account",
                          style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      SignUpCreateAccountPage()));
                            });
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.pink),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "or",
                          style: GoogleFonts.roboto(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Forget Password?",
                      style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonBtmNbBar(),
    );
  }
}

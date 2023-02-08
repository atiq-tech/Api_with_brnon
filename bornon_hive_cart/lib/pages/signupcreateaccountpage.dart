import 'package:cart_and_hive/btmnbr/bottomnavigationbar_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpCreateAccountPage extends StatefulWidget {
  const SignUpCreateAccountPage({super.key});

  @override
  State<SignUpCreateAccountPage> createState() =>
      _SignUpCreateAccountPageState();
}

class _SignUpCreateAccountPageState extends State<SignUpCreateAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 59, 101, 133),
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20.0,
              )),
          centerTitle: true,
          title: Text(
            "Create Account",
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gradiant1.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.0),
              Text(
                "Name",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 243, 241, 241),
                  ),
                  hintText: "Enter Name",
                  hintStyle: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                  fillColor:
                      Color.fromARGB(255, 167, 213, 221).withOpacity(0.7),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Phone",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 243, 241, 241),
                  ),
                  hintText: "Enter phone",
                  hintStyle: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                  fillColor:
                      Color.fromARGB(255, 167, 213, 221).withOpacity(0.7),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Address",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 243, 241, 241),
                  ),
                  hintText: "Enter address",
                  hintStyle: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                  fillColor:
                      Color.fromARGB(255, 167, 213, 221).withOpacity(0.7),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Password",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.visibility_off,
                    color: Color.fromARGB(255, 243, 241, 241),
                  ),
                  hintText: "Enter password",
                  hintStyle: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                  fillColor:
                      Color.fromARGB(255, 167, 213, 221).withOpacity(0.7),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                  height: 45.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color:
                          Color.fromARGB(255, 224, 40, 154).withOpacity(0.8)),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  )),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.italic,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 247, 243, 243)),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 212, 4, 185)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBtmNbBar(),
    );
  }
}

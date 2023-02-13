import 'package:bornon_app/home_page.dart';
import 'package:bornon_app/pages/allproduct_page.dart';
import 'package:bornon_app/pages/category_page.dart';
import 'package:bornon_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonBtmNbBar extends StatelessWidget {
  const CommonBtmNbBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          // image: DecorationImage(
          // image: AssetImage("assets/gradiant1.jpg"), fit: BoxFit.fill),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 170, 217, 255),
              Color.fromARGB(255, 235, 190, 241),
              Color.fromARGB(255, 194, 253, 248),
              Color.fromARGB(255, 253, 201, 198),
            ],
          ),
          color: Color.fromARGB(255, 201, 241, 253),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.home, size: 22.0),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                  ),
                  Text(
                    "Home",
                    style: GoogleFonts.roboto(
                        fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.production_quantity_limits, size: 22.0),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllProductPage(),
                          ));
                    },
                  ),
                  Text(
                    "Product",
                    style: GoogleFonts.roboto(
                        fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.category, size: 22.0),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(),
                          ));
                    },
                  ),
                  Text(
                    "Category",
                    style: GoogleFonts.roboto(
                        fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.person, size: 22.0),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => logInPage(),
                          ));
                    },
                  ),
                  Text(
                    "Account",
                    style: GoogleFonts.roboto(
                        fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bornon_app/drawer_sections/drawer_items.dart';
import 'package:bornon_app/drawer_sections/my_orders_page.dart';
import 'package:bornon_app/home_page.dart';
import 'package:bornon_app/pages/allproduct_page.dart';
import 'package:bornon_app/pages/category_page.dart';
import 'package:bornon_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CommonDrawerPage extends StatefulWidget {
  const CommonDrawerPage({super.key});

  @override
  State<CommonDrawerPage> createState() => _CommonDrawerPageState();
}

class _CommonDrawerPageState extends State<CommonDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(221, 228, 166, 207),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 130.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/dwr.jpg"), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 2.0),
                        color: Color.fromARGB(255, 0, 0, 0),
                        spreadRadius: 1.0,
                        blurRadius: 1.0)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  color: Color.fromARGB(255, 255, 3, 129),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your name',
                          style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Enter your phone',
                          style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          HomePage())); //Home page in drawer
                });
              },
              child: DrawerItems(
                icon: Icons.home,
                text: 'HOME',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryPage())); //categories page in drawer
                });
              },
              child: DrawerItems(
                icon: Icons.category,
                text: 'CATEGORIES',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AllProductPage())); //shop page in drawer
                });
              },
              child: DrawerItems(
                icon: Icons.shopping_cart,
                text: 'SHOP',
              ),
            ),
            DrawerItems(
              icon: Icons.person_add_rounded,
              text: 'MY ACCOUNT',
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyOrdersPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.lock_clock_sharp,
                text: 'MY ORDERS',
              ),
            ),
            DrawerItems(
              icon: Icons.favorite,
              text: 'MY FAVORITES',
            ),
            DrawerItems(
              icon: Icons.file_copy_sharp,
              text: 'INTRO',
            ),
            DrawerItems(
              icon: Icons.newspaper,
              text: 'NEWS',
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => logInPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.login,
                text: 'LOG OUT',
              ),
            ),
          ],
        ),
      );
  }
}

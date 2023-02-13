
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 166, 245),
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 60, 84, 102),
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
            "Your Orders",
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              color: Color.fromARGB(255, 192, 245, 233),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 21.0, bottom: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invoice number:12345",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Order Date:12345",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status:576554",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Amount:12345",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => SizedBox(
            height: 0.0,
          ),
        ),
      ),
    bottomNavigationBar: CommonBtmNbBar(),
    );
  }
}

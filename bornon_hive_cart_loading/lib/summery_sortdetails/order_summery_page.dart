import 'package:cart_and_hive/btmnbr/bottomnavigationbar_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummeryPage extends StatefulWidget {
  const OrderSummeryPage({super.key});

  @override
  State<OrderSummeryPage> createState() => _OrderSummeryPageState();
}

class _OrderSummeryPageState extends State<OrderSummeryPage> {
  List<String> items = [
    'Cash on delivery',
    'Collect from shop',
    'Courier',
  ];
  String dropdownValue = 'Cash on delivery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 75, 92, 105),
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 18.0,
              )),
          centerTitle: true,
          title: Text(
            "Order Summery",
            style: GoogleFonts.roboto(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 45.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: Color.fromARGB(255, 246, 247, 247),
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Baby Lotion",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "1",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "2000",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "2000",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trailoring Charge",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "0.00",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Wrapping Charge",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "0.00",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charge",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "2,000.00",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.black),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          Text(
                            "2000",
                            style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              color: Color.fromARGB(255, 158, 158, 158),
              child: Center(
                child: Text(
                  "Billing Address",
                  style: GoogleFonts.roboto(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                //color: Colors.amber.shade100,
                padding: EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 248, 229, 172),
                        //padding: EdgeInsets.only(left: 5.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Enter name",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color.fromARGB(255, 250, 242, 216)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      hintText: "Enter name"),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Billing address",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color.fromARGB(255, 250, 242, 216)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      hintText: "Billing address"),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Enter Email",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 12.0),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color.fromARGB(255, 250, 242, 216)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      hintText: "Enter Email"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 167, 219, 250),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Enter Mobile",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color.fromARGB(255, 209, 231, 238)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      hintText: "Mobile NO:"),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Order note",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10.0, top: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color.fromARGB(255, 209, 231, 238)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      hintText: "Order note"),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Select your Option",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 95, 100, 100)),
                                ),
                              ),
                              SizedBox(height: 12.0),
                              Container(
                                height: 50.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color.fromARGB(255, 190, 234, 255)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    items: items.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue ?? '';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 147, 112, 212),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Text(
                      "Check Out",
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
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

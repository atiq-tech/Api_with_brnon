import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bornon_app/api_models/product_model.dart';
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class OrderSummeryPage extends StatefulWidget {
  OrderSummeryPage({
    super.key,
    required this.checkoutPage,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.productSubTotalPrice,
    this.productTotalPrice,
  });
  late String checkoutPage;
  String? productName;
  int? productPrice, productQuantity, productSubTotalPrice, productTotalPrice;

  @override
  State<OrderSummeryPage> createState() => _OrderSummeryPageState();
}

class _OrderSummeryPageState extends State<OrderSummeryPage> {
  TextEditingController _billingNameController = TextEditingController();
  TextEditingController _billingAddressController = TextEditingController();
  TextEditingController _billingEmailController = TextEditingController();
  TextEditingController _billingMobileController = TextEditingController();
  TextEditingController _billingOrderNoteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int deliveryCarge = 50;

  late final Box box;
  @override
  void initState() {
    super.initState();
    print("chekoutdata form==${widget.checkoutPage}");
    print("chekoutdata form==${widget.productName}");
    print("chekoutdata form==${widget.productPrice}");
    print("chekoutdata form==${widget.productQuantity}");
    print("chekoutdata form==${widget.productSubTotalPrice}");
    print("chekoutdata form==${widget.productTotalPrice}");
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

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
          backgroundColor: const Color.fromARGB(255, 75, 92, 105),
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 20.0,
              )),
          centerTitle: true,
          title: Text(
            "Order Summery",
            style: GoogleFonts.roboto(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),

      // body: widget.checkoutPage == "card"
      //     ? Container(
      //         height: double.infinity,
      //         width: double.infinity,
      //         color: Color.fromARGB(255, 3, 143, 66),
      //       )
      //     : Text("${widget.productName}"),

      body: widget.checkoutPage == "card"
          ? Container(
              color: const Color.fromARGB(255, 246, 247, 247),
              // height: 200,width: 200,
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box box, widget) {
                  if (box.isEmpty) {
                    return Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText(
                              "    No items in Cart,\nPlease add items in Cart",
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: "MonteCarlo",
                                color: Color.fromARGB(255, 3, 143, 66),
                              )),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        const SizedBox(height: 10.0),
                        Container(
                          height: 500.0,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              var currentBox = box;
                              var productData = currentBox.getAt(index)!;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, bottom: 5.0),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2,
                                      )),
                                  color:
                                      const Color.fromARGB(255, 236, 240, 245),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0, left: 10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Product Name: ",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "${productData.productName}",
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 136, 127, 127),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Product Price: ",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "\$ ${productData.productPrice}",
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 126, 129, 129),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Quantity: ",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "${productData.productQuantity}",
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 126, 129, 129),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Delivery Charge: ",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  " \$ $deliveryCarge",
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 126, 129, 129),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Subtotal: ",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  " \$ ${productData.productQuantity * productData.productPrice}",
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 126, 129, 129),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                num totalPrice = 0;
                                for (int i = 0; i < box.length; i++) {
                                  var productData = box.getAt(i)!;

                                  totalPrice += productData.productPrice *
                                      productData.productQuantity;
                                }
                                return Center(
                                  child: Text(
                                    "Total Price: \$ ${totalPrice + deliveryCarge}.00",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 45, 59, 59),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Text(
                              "Check Out",
                              style: GoogleFonts.roboto(
                                fontStyle: FontStyle.italic,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(255, 255, 255, 255),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 260.0,
                      width: double.infinity,
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                      //color: Color.fromARGB(255, 98, 241, 175),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name :",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${widget.productName}",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Divider(
                            height: 15.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quantity :",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 71, 69, 69),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${widget.productQuantity}",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 71, 69, 69),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Divider(
                            height: 15.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price :",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 68, 66, 66),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$ ${widget.productPrice}.00",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 68, 66, 66),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Divider(
                            height: 15.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total :",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$ ${widget.productSubTotalPrice}.00",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Divider(
                            height: 15.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Charge :",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${deliveryCarge}.00",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Divider(
                            height: 15.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total :",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$ ${widget.productTotalPrice! + deliveryCarge}.00",
                                style: GoogleFonts.robotoSlab(
                                    color: Color.fromARGB(255, 85, 83, 83),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Divider(
                            height: 15.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        "Billing Address",
                        style: GoogleFonts.roboto(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Container(
                      height: 280.0,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      // color: Color.fromARGB(255, 39, 39, 39),
                      child: Row(
                        children: [
                          Container(
                            height: 260.0,
                            width: 178.0,
                            color: Color.fromARGB(255, 249, 229, 96),
                            child: Form(
                              key: _formKey,
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
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Container(
                                    height: 50.0,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: const Color.fromARGB(
                                            255, 250, 242, 216)),
                                    child: TextFormField(
                                      controller: _billingNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Value is invalid";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15.0),
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
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Container(
                                    height: 50.0,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: const Color.fromARGB(
                                            255, 250, 242, 216)),
                                    child: TextFormField(
                                      controller: _billingAddressController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Value is invalid";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          hintText: "Billing address"),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Enter Email",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                  Container(
                                    height: 50.0,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 15.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: const Color.fromARGB(
                                            255, 250, 242, 216)),
                                    child: TextFormField(
                                      controller: _billingEmailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Value is invalid";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          hintText: "Enter Email"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Container(
                            height: 260.0,
                            width: 178.0,
                            color: const Color.fromARGB(255, 167, 219, 250),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Enter Mobile",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Container(
                                  height: 50.0,
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 15.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: const Color.fromARGB(
                                          255, 209, 231, 238)),
                                  child: TextFormField(
                                    controller: _billingMobileController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Value is invalid";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        hintText: "Mobile NO:"),
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Order note",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Container(
                                  height: 50.0,
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 15.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: const Color.fromARGB(
                                          255, 209, 231, 238)),
                                  child: TextFormField(
                                    controller: _billingOrderNoteController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Value is invalid";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        hintText: "Order note"),
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Select your Option",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 95, 100, 100)),
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Container(
                                  height: 50.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: const Color.fromARGB(
                                          255, 190, 234, 255)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      items: items
                                          .map<DropdownMenuItem<String>>(
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
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 162, 196, 235),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          "Update",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 45, 59, 59),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            "Check Out",
                            style: GoogleFonts.roboto(
                              fontStyle: FontStyle.italic,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: CommonBtmNbBar(),
    );
  }
}

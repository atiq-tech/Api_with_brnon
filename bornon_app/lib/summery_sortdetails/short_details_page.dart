import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/size/size_items.dart';
import 'package:bornon_app/summery_sortdetails/order_summery_page.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:bornon_app/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShortDetailsPage extends StatefulWidget {
  ShortDetailsPage({
    super.key,
    required this.pPrice,
    required this.pName,
    required this.pImage,
    required this.pQuantity,
    required this.pShortDetails,
    required this.pCategoryId,
    required this.pDescription,
  });
  final String pName, pImage;
  final int pPrice;
  int pQuantity;
  final String pShortDetails;
  final String pCategoryId;
  final String pDescription;
  @override
  State<ShortDetailsPage> createState() => _ShortDetailsPageState();
}

class _ShortDetailsPageState extends State<ShortDetailsPage> {
  final sizedata = SizeItems.generatedMySourecList();
  late final Box box;

  @override
  void initState() {
    super.initState();
    print(widget.pName);
    print(widget.pImage);
    print(widget.pPrice);
    print(widget.pQuantity);

    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  final mySize = SizeItems.generatedMySourecList();
  int isPress = 1;
  int quantity = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText(
                          "    No items in Cart,\nPlease add items in Cart",
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "MonteCarlo",
                            color: Color.fromARGB(255, 3, 143, 66),
                          )),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: InkWell(
                            onTap: () {
                              box.clear();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Delete cart",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 18.0,
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
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
                                color: Color.fromARGB(255, 84, 129, 182),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              16,
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 196, 3, 202),
                                          ),
                                          child: Image.network(
                                            "$imgUrl${productData.productImage}",
                                            fit: BoxFit.fill,
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${productData.productName}",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Price:${productData.productPrice}",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 46, 51, 51),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Quantity:${productData.productQuantity}",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (productData
                                                            .productQuantity >
                                                        1) {
                                                      productData
                                                          .productQuantity--;

                                                      ProductDetails
                                                          existingProduct =
                                                          box.getAt(index);

                                                      existingProduct
                                                              .productQuantity =
                                                          productData
                                                              .productQuantity--;

                                                      box.putAt(index,
                                                          existingProduct);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 66, 91, 117),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0)),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Color.fromARGB(
                                                        255, 212, 209, 209),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                "${productData.productQuantity}",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 28, 28, 29),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    productData
                                                        .productQuantity++;

                                                    ProductDetails
                                                        existingProduct =
                                                        box.getAt(index);

                                                    existingProduct
                                                            .productQuantity =
                                                        productData
                                                            .productQuantity++;

                                                    box.putAt(
                                                        index, existingProduct);
                                                  });
                                                },
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 66, 91, 117),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0)),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color.fromARGB(
                                                        255, 212, 209, 209),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 66, 91, 117),
                                                borderRadius:
                                                    BorderRadius.circular(4.0)),
                                            child: InkWell(
                                              onTap: () {
                                                _deleteProduct(index);
                                                setState(() {
                                                  box.length;
                                                  print(box.length);
                                                });
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 212, 209, 209),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
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
                            height: 100,
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
                                  child: Column(
                                    children: [
                                      Text(
                                        "Total Price: \$ ${totalPrice.toString()}.00",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderSummeryPage()));
                                              });
                                            },
                                            child: Text("Order Here")),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ))
                    ],
                  ),
                );
              }
            },
          ),
        ),
        backgroundColor: Color.fromARGB(255, 198, 250, 239),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 82, 88, 100),
            title: Text("Bornon"),
            actions: [
              Icon(Icons.search),
              SizedBox(width: 10.0),
              Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
                child: ShoppingCartBadge(),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  //color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 177, 12, 163),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "$imgUrl${widget.pImage}",
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          //color: Color.fromARGB(255, 247, 99, 234),
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 50,
                                  height: 70,
                                  margin: EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "$imgUrl${widget.pImage}"),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) =>
                                  SizedBox(height: 10.0),
                              itemCount: 6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Expanded(
                  flex: 7,
                  child: Container(
                    //color: Color.fromARGB(255, 65, 80, 92),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                widget.pName,
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.pQuantity > 1
                                        ? widget.pQuantity--
                                        : widget.pQuantity;
                                  });
                                },
                                child: Container(
                                  width: 18.0,
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 14.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                widget.pQuantity.toString(),
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.pQuantity > 0
                                        ? widget.pQuantity++
                                        : widget.pQuantity;
                                  });
                                },
                                child: Container(
                                  width: 18.0,
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Short Details:",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 1.0,
                            width: 150.0,
                            color: Colors.black,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "${widget.pShortDetails}",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            children: [
                              Text(
                                "Price:",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "৳ ${widget.pPrice.toString()}",
                                style: GoogleFonts.roboto(
                                    color: Color.fromARGB(255, 43, 42, 42),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "Category id: ",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${widget.pCategoryId}",
                                style: GoogleFonts.roboto(
                                    color: Color.fromARGB(255, 43, 42, 42),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "❤️ Add to wishlist",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                "Color:",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                height: 20.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30.0)),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Text(
                                "Size:",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                height: 40.0,
                                width: 180.0,
                                padding: EdgeInsets.all(5.0),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: sizedata.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPress = index;
                                        });
                                      },
                                      child: Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                            color: isPress == index
                                                ? Color.fromARGB(
                                                    255, 223, 13, 94)
                                                : Color.fromARGB(
                                                    255, 238, 113, 154),
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Center(
                                          child: Text(
                                            "${mySize[index].T_shirt_size}",
                                            style: GoogleFonts.roboto(
                                                color: isPress == index
                                                    ? Colors.white
                                                    : Color.fromARGB(
                                                        255, 5, 110, 197),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, index) => SizedBox(
                                    width: 10.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Description:${widget.pDescription}",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderSummeryPage()));
                                    });
                                  },
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                          color: Color.fromARGB(
                                              255, 24, 125, 240)),
                                      child: Center(
                                        child: Text(
                                          "Check out",
                                          style: GoogleFonts.roboto(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                                SizedBox(width: 10.0),
                                Builder(
                                  builder: (context) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        Scaffold.of(context).openEndDrawer();
                                        bool found = false;
                                        for (int i = 0; i < box.length; i++) {
                                          ProductDetails existingProduct =
                                              box.getAt(i);
                                          if (existingProduct.productName ==
                                                  widget.pName &&
                                              existingProduct.productPrice ==
                                                  widget.pPrice) {
                                            existingProduct.productQuantity =
                                                widget.pQuantity;
                                            box.putAt(i, existingProduct);
                                            found = true;
                                            break;
                                          }
                                        }
                                        if (!found) {
                                          ProductDetails productDetails =
                                              ProductDetails(
                                                  productName: widget.pName,
                                                  productPrice: widget.pPrice,
                                                  productQuantity:
                                                      widget.pQuantity,
                                                  productImage: widget.pImage);
                                          box.add(productDetails);
                                        }
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            bottomRight: Radius.circular(30.0),
                                          ),
                                          color: Color.fromARGB(
                                              255, 189, 199, 95)),
                                      child: Center(
                                        child: Text(
                                          "Add To Cart",
                                          style: GoogleFonts.roboto(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CommonBtmNbBar(),
      ),
    );
  }
}

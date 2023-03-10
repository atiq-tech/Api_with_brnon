import 'dart:convert';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:cart_and_hive/api_models/product_model.dart';
import 'package:cart_and_hive/btmnbr/bottomnavigationbar_part.dart';
import 'package:cart_and_hive/drawer_sections/drawer_items.dart';
import 'package:cart_and_hive/drawer_sections/my_orders_page.dart';
import 'package:cart_and_hive/home_page.dart';
import 'package:cart_and_hive/loading/loading_indicator.dart';
import 'package:cart_and_hive/model/product.dart';
import 'package:cart_and_hive/model/product_list.dart';
import 'package:cart_and_hive/pages/category_page.dart';
import 'package:cart_and_hive/pages/login_page.dart';
import 'package:cart_and_hive/size/size_items.dart';
import 'package:cart_and_hive/summery_sortdetails/short_details_page.dart';
import 'package:cart_and_hive/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class AllProductPage extends StatefulWidget {
  AllProductPage({
    super.key,
  });

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  String Link = "https://bornonbd.com/api/product";
  List<ProductModel> allProductlistData = [];
  late ProductModel productModel;

  bool isLoading = false;

  Future<List<ProductModel>> GetApiData() async {
    try {
      setState(() {
        isLoading = true;
      });
      var Response = await http.get(Uri.parse(Link));
      if (Response.statusCode == 200) {
        var data = jsonDecode(Response.body)["data"];
        print(
            "  sssssssssssssss Sob Gulo Data amake diye dew taratari sssssssssss : ${data}");
        for (var i in data) {
          productModel = ProductModel.fromJson(i);
          allProductlistData.add(productModel);
        }
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        Future.error("Error amr vhul hocee amay khoma kori den:$e");
      });
    }
    return allProductlistData;
  }

  String imgUrl = "http://bornonbd.com/uploads/products/original/";
  late final Box box;

  @override
  void initState() {
    GetApiData();
    super.initState();
    setState(() {});
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
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
        ),
        endDrawer: Drawer(
          child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return Center(
                  child: Text(
                    'No items in Cart, please add items.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 77, 2, 107),
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
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
                                      color: Color.fromARGB(255, 39, 112, 247),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 0, 0, 0),
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
                                          child: Image.asset(
                                            "${productData.productImage}",
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
                                            onPressed: () {},
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
        backgroundColor: Color.fromARGB(255, 151, 185, 236),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 108, 131, 165),
            elevation: 3.0,
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Center(
                  child: Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 252, 249, 249),
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            title: Text(
              "All Product",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 252, 249, 249)),
            ),
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
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
              future: GetApiData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Errors:${snapshot.error}");
                }
                if (snapshot.hasData) {
                  List<ProductModel> allProductlistData = snapshot.data ?? [];
                  return GridView.builder(
                      itemCount: allProductlistData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 5 / 7),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ShortDetailsPage(
                                  pImage: allProducts[index]["pImage"],
                                  pName: allProducts[index]['pName'],
                                  pPrice: allProducts[index]["pPrice"],
                                  pQuantity: allProducts[index]["pQuantity"],
                                  pShortDetails: allProducts[index]
                                      ["pShortDetails"],
                                  pCategoryId: allProducts[index]
                                      ["pCategoryId"],
                                );
                              })).then((_) => setState(() {}));
                            });
                          },
                          child: Container(
                            decoration: new BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                    color: Color.fromARGB(255, 137, 181, 250),
                                    spreadRadius: 5,
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 0.1)),
                              ],
                            ),
                            child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, left: 5.0, right: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 173, 171, 171),
                                                  spreadRadius: 0.10,
                                                  blurRadius: 0.0,
                                                  offset: Offset(0.0, 0.1))
                                            ],
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "$imgUrl${allProductlistData[index].mainImage}"),
                                                fit: BoxFit.fill),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 0.0,
                                                right: 0.0,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 248, 69, 56),
                                                  radius: 18.0,
                                                  child: Text(
                                                    "25%",
                                                    style: TextStyle(
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        //color: Color.fromARGB(255, 235, 209, 209),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10.0),
                                            Text(
                                              "${allProductlistData[index].name}",
                                              style: TextStyle(fontSize: 12.0),
                                            ),
                                            SizedBox(height: 5.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  " ??? ${allProductlistData[index].price}",
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                                Icon(
                                                  Icons.favorite,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  size: 12.0,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }
                return LoadingIndicator();
              }),
        ),
        bottomNavigationBar: CommonBtmNbBar(),
      ),
    );
  }
}

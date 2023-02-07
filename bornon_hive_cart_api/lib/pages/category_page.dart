import 'package:badges/badges.dart';
import 'package:cart_and_hive/btmnbr/bottomnavigationbar_part.dart';
import 'package:cart_and_hive/drawer_sections/drawer_items.dart';
import 'package:cart_and_hive/drawer_sections/my_orders_page.dart';
import 'package:cart_and_hive/home_page.dart';
import 'package:cart_and_hive/model/product.dart';
import 'package:cart_and_hive/model/product_list.dart';
import 'package:cart_and_hive/pages/allproduct_page.dart';
import 'package:cart_and_hive/pages/login_page.dart';
import 'package:cart_and_hive/pages/sub_category_page.dart';
import 'package:cart_and_hive/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final Box box;

  @override
  void initState() {
    super.initState();
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
                          color: Colors.black,
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
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Enter your phone',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
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
            backgroundColor: Color.fromARGB(255, 107, 116, 124),
            elevation: 3.0,
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Center(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            title: Text(
              "All Category",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.white),
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
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 5 / 7),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SubCategoryPage(
                        categoryName: categoryList[index]["catItemName"],
                        categoryIndex: index,
                      );
                    })).then((_) => setState(() {}));
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                //padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 173, 171, 171),
                                        spreadRadius: 0.10,
                                        blurRadius: 0.0,
                                        offset: Offset(0.0, 0.1))
                                  ],
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 173, 171, 171),
                                            spreadRadius: 0.10,
                                            blurRadius: 0.0,
                                            offset: Offset(0.0, 0.1))
                                      ],
                                      image: DecorationImage(
                                          image: AssetImage(categoryList[index]
                                              ["catItemImage"]),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0.0,
                                          right: 0.0,
                                          child: CircleAvatar(
                                            backgroundColor: Color.fromARGB(
                                                255, 248, 69, 56),
                                            radius: 18.0,
                                            child: Text(
                                              "25%",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                //color: Color.fromARGB(255, 2, 24, 43),
                                child: Center(
                                  child: Text(
                                    categoryList[index]["catItemName"],
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        bottomNavigationBar: CommonBtmNbBar(),
      ),
    );
  }
}

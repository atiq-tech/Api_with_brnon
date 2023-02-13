import 'package:bornon_app/btmnbr/bottomnavigationbar_part.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/model/product_list.dart';
import 'package:bornon_app/pages/category_details_products.dart';
import 'package:bornon_app/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubCategoryPage extends StatefulWidget {
  SubCategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryIndex,
  });
  final String categoryName;
  int categoryIndex;

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  late final Box box;

  @override
  void initState() {
    setState(() {});
    super.initState();
    print(widget.categoryName);
    print(widget.categoryIndex);
    print("length: ${categoryList[widget.categoryIndex]["pList"].length}");
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        padding: EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 196, 3, 202),
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
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
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
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

                                                    box.putAt(
                                                        index, existingProduct);
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
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  productData.productQuantity++;

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
      backgroundColor: Color.fromARGB(255, 127, 175, 214),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 99, 126),
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            widget.categoryName.toString(),
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
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
        child: GridView.builder(
            itemCount: categoryList[widget.categoryIndex]["pList"].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 5 / 7),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CategoryDetailsProduct(
                      catProPrice: categoryList[widget.categoryIndex]["pList"]
                          [index]["pPrice"],
                      catProName: categoryList[widget.categoryIndex]["pList"]
                          [index]["pName"],
                      catProImage: categoryList[widget.categoryIndex]["pList"]
                          [index]["pImage"],
                      catProQuantity: categoryList[widget.categoryIndex]
                          ["pList"][index]["pQuantity"],
                      catProIndex: index,
                    );
                  })).then((_) => setState(() {}));
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 173, 171, 171),
                                      spreadRadius: 0.10,
                                      blurRadius: 0.0,
                                      offset: Offset(0.0, 0.1))
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                      categoryList[widget.categoryIndex]
                                          ["pList"][index]["pImage"],
                                    ),
                                    fit: BoxFit.fill),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 248, 69, 56),
                                      radius: 18.0,
                                      child: Text(
                                        "25%",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            //color: Color.fromARGB(255, 235, 209, 209),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0),
                                Text(
                                  categoryList[widget.categoryIndex]["pList"]
                                      [index]["pName"],
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  categoryList[widget.categoryIndex]["pList"]
                                          [index]["pQuantity"]
                                      .toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " ৳ ${categoryList[widget.categoryIndex]["pList"][index]['pPrice']}",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.black,
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
              );
            }),
      ),
      bottomNavigationBar: CommonBtmNbBar(),
    );
  }
}

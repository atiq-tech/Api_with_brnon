import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bornon_app/api_models/product_model.dart';
import 'package:bornon_app/model/itemlistpart.model.dart';
import 'package:bornon_app/model/product.dart';
import 'package:bornon_app/summery_sortdetails/order_summery_page.dart';
import 'package:bornon_app/url_api/imgurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommonEndDrawerPage extends StatefulWidget {
  const CommonEndDrawerPage({super.key});

  @override
  State<CommonEndDrawerPage> createState() => _CommonEndDrawerPageState();
}

class _CommonEndDrawerPageState extends State<CommonEndDrawerPage> {
  final Mydata = ItemListPartModel.generatedMySourecList();
  int isClick = 1;
  late final Box box;
  late Future<List<ProductModel>> _futureData;
  @override
  void initState() {
    // _futureData = GetApiData();
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  int deliveryCarge = 50;
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          children: const [
                            Text(
                              "Delete cart",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 155, 255),
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
                  const SizedBox(height: 10.0),
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
                            color: const Color.fromARGB(255, 84, 129, 182),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16,
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 196, 3, 202),
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
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Price:${productData.productPrice}",
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 46, 51, 51),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Quantity:${productData.productQuantity}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
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
                                                  productData.productQuantity--;

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
                                                  color: const Color.fromARGB(
                                                      255, 66, 91, 117),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0)),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color.fromARGB(
                                                    255, 212, 209, 209),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            "${productData.productQuantity}",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 28, 28, 29),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(width: 10.0),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                productData.productQuantity++;

                                                ProductDetails existingProduct =
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
                                                  color: const Color.fromARGB(
                                                      255, 66, 91, 117),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0)),
                                              child: const Icon(
                                                Icons.add,
                                                color: Color.fromARGB(
                                                    255, 212, 209, 209),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: 25.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
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
                                          child: const Icon(
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
                                    "Total Price: \$ ${totalPrice + deliveryCarge}.00",
                                    style: const TextStyle(
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
                                                        OrderSummeryPage(
                                                          checkoutPage: "card",
                                                        )));
                                          });
                                        },
                                        child: const Text("Order Here")),
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
    );
  }
}

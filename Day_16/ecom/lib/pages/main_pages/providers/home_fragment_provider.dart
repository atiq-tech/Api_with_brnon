import 'dart:convert';

import 'package:ecom/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeFragmentProvider with ChangeNotifier {
  bool isloading = true;

  List<ProductModel> products = [];
  HomeFragmentProvider() {
    loadingallProduct();
  }

  void loadingallProduct() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      List allProducts = jsonDecode(response.body);
      allProducts.forEach((productMap) {
        products.add(ProductModel.fromJson(productMap));
      });
    } else {
      print("errors");
    }
    print(products);
    isloading = false;
    notifyListeners();
  }
}

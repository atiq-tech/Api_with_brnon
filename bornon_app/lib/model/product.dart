import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class ProductDetails {
  @HiveField(0)
  final String productName;

  @HiveField(1)
  final int productPrice;

  @HiveField(2)
  int productQuantity;

  @HiveField(3)
  String productImage;

  ProductDetails({
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productImage,
  });
}

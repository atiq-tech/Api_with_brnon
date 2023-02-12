import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hive/hive.dart';

class ShoppingCartBadge extends StatefulWidget {
  const ShoppingCartBadge({Key? key}) : super(key: key);

  @override
  State<ShoppingCartBadge> createState() => _ShoppingCartBadgeState();
}

class _ShoppingCartBadgeState extends State<ShoppingCartBadge> {
  late final Box box;

  // Add info to people box

  @override
  void initState() {
    super.initState();

    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  final int _cartBadgeAmount = 1;
  late bool _showCartBadge;

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: badges.BadgeAnimation.slide(),
      showBadge: _showCartBadge,
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.red,
      ),
      badgeContent: Text(
        box.length.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
        icon: Icon(Icons.shopping_cart_checkout_outlined),
        onPressed: () => Scaffold.of(context).openEndDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    );
  }
}

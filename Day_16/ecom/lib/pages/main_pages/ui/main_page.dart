import 'package:ecom/core/constants/asset_icon_tabbar.dart';
import 'package:ecom/core/constants/my_colors.dart';
import 'package:ecom/pages/main_pages/providers/main_page_provider.dart';
import 'package:ecom/pages/main_pages/ui/fragments/cart_fragment.dart';
import 'package:ecom/pages/main_pages/ui/fragments/home_fragment.dart';
import 'package:ecom/pages/main_pages/ui/fragments/wish_list_fragment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPageProvider(),
      builder: (context, child) => Scaffold(
        body: Consumer<MainPageProvider>(
          builder: (context, mainPageProvider, child) {
            if (mainPageProvider.getSelectedTabIndex() == 0) {
              return HomeFragment();
            }
            if (mainPageProvider.getSelectedTabIndex() == 1) {
              return CartFragment();
            }
            if (mainPageProvider.getSelectedTabIndex() == 2) {
              return WishListFragment();
            }
            return Center(
              child: Text("No Tab Selected"),
            );
          },
        ),
        bottomNavigationBar: Consumer<MainPageProvider>(
          builder: (context, mainPageProvider, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: MyColors.primaryColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: mainPageProvider.getSelectedTabIndex(),
                    onTap: (index) {
                      mainPageProvider.setTab(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: Image.asset(
                            AssetIconTabbar.Home_IconAsset,
                            width: 50.0,
                            height: 50.0,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: Image.asset(
                            AssetIconTabbar.Cart_IconAsset,
                            width: 50.0,
                            height: 50.0,
                          ),
                          label: "Cart"),
                      BottomNavigationBarItem(
                          icon: Image.asset(
                            AssetIconTabbar.WishList_IconAsset,
                            width: 50.0,
                            height: 50.0,
                          ),
                          label: "Wish List"),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

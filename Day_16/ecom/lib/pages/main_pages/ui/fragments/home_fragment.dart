import 'dart:ui';

import 'package:ecom/core/constants/all_item_assets.dart';
import 'package:ecom/core/constants/asset_icon_tabbar.dart';
import 'package:ecom/core/constants/my_colors.dart';
import 'package:ecom/core/widgets/my_app_bar.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/pages/main_pages/providers/home_fragment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeFragmentProvider(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            slivers: [
              const MyAppBar(
                hedertxt: "Hello,Welcome 👋",
                HeaderName: "Atiqur Rahman Atiq",
              ),
              _SearchBar(),
              _CategoriesTab(),
              SliverToBoxAdapter(
                child: Consumer<HomeFragmentProvider>(
                    builder: (context, homeFragmentProvider, child) {
                  List<ProductModel> products = homeFragmentProvider.products;
                  return homeFragmentProvider.isloading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: MyColors.primaryColor,
                          ),
                        )
                      : GridView.builder(
                          itemCount: homeFragmentProvider.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 3 / 6),
                          itemBuilder: (context, index) => ProductCard(
                              images: products[index].image ??
                                  "https://picsum.photos/200/300",
                              title: (products[index].title!.length > 20
                                      ? "${products[index].title!.substring(0, 20)}..."
                                      : products[index].title) ??
                                  "No title",
                              Category: "${products[index].category}",
                              price: "\$${products[index].price.toString()}",
                              stars: "⭐ 5.0"),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String images;
  final String title;
  final String Category;
  final String price;
  final String stars;

  const ProductCard(
      {Key? key,
      required this.images,
      required this.title,
      required this.Category,
      required this.price,
      required this.stars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.topRight,
              width: double.infinity,
              child: IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 161, 4, 140),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  )),
              decoration: BoxDecoration(
                color: MyColors.InputtxtColor,
                borderRadius: BorderRadius.circular(18.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    Category,
                    style: const TextStyle(
                        color: MyColors.secondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        stars,
                        style: const TextStyle(
                            color: MyColors.secondaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class _CategoriesTab extends StatelessWidget {
  const _CategoriesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        height: 90.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: ((context, index) => CategoryTab(
                icon: AllItemAssets.ItemCategoryImg,
                title: "All Items ${index}",
                isSelected: index == 2,
              )),
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  const CategoryTab(
      {required this.icon, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0.w,
      margin: const EdgeInsets.only(right: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      decoration: BoxDecoration(
          color: isSelected ? MyColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: MyColors.InputtxtColor)),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20.w,
            color: isSelected ? Colors.white : MyColors.primaryColor,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.white : MyColors.primaryColor),
          )
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset(
                AssetIconTabbar.SearchimgIcon,
                width: 15,
                height: 15,
              ),
            ),
            hintText: "Search clothes...",
            hintStyle: TextStyle(fontSize: 14.h, color: MyColors.hinttxtColor),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEDEDED),
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: MyColors.InputtxtColor,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}

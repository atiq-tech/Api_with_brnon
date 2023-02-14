import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselItems extends StatelessWidget {
  const CarouselItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: CarouselSlider(
        items: [
          //1st Image of Slider
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/slide1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          //2nd Image of Slider
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wilcox.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3rd Image of Slider
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/slide1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          //4th Image of Slider
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/sharee1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
        //Slider Container properties
        options: CarouselOptions(
          height: 250.0,
          //enlargeCenterPage: true,
          autoPlay: true,

          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
      ),
    );
  }
}

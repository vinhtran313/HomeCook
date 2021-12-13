import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RecipeCarousel extends StatefulWidget {
  final List<String> urls;
  final ValueChanged<int> removeItem;

  const RecipeCarousel({Key? key, required this.urls, required this.removeItem})
      : super(key: key);

  @override
  _RecipeCarouselState createState() => _RecipeCarouselState();
}

class _RecipeCarouselState extends State<RecipeCarousel> {
  Widget buildImage(String url, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: -5,
            right: -5,
            child: IconButton(
              icon: Icon(Icons.cancel_outlined),
              color: Colors.white,
              onPressed: () {
                widget.removeItem(index);
              },
            ),
          ),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider.builder(
            itemCount: widget.urls.length,
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: false,
            ),
            itemBuilder: (context, index, realIndex) {
              final url = widget.urls[index];
              return buildImage(url, index);
            }),
      ]),
    );
  }
}

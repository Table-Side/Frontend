import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.label,
    required this.onTap,
    required this.height,
    required this.width,
    required this.cuisine,
    required this.rating,
  });

  final String label;
  final VoidCallback onTap;
  final double height;
  final double width;

  final String cuisine;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // restaurant image
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Image(
                    image: AssetImage("assets/burger.jpg"),
                    fit: BoxFit.fill,
                  ), // remove this if we don't want an image
                ),
              ),

              // restaurant text
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO(A): GET DATA FROM DB
                    // name - need to get from db
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    // TODO(A): GET DATA FROM DB
                    // type of cuisine - need to get from db
                    Text(
                      cuisine,
                      textAlign: TextAlign.center,
                    ),

                    // TODO(A): GET DATA FROM DB
                    // rating - need to get from db
                    Text(
                      rating.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

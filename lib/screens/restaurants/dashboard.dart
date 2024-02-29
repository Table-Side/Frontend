import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';
import 'package:table_side/components/restaurant_card.dart';
import 'package:table_side/components/dropdown_checkbox.dart';

/*
  TODO: fetch restaurants from db
  TODO: fetch cuisines, ratings, prices?
  TODO: show specific restaurants if search bar or checkboxes are used
 */

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController searchController = TextEditingController(); // for search bar

  bool showCuisines = false; // show cuisine options
  bool showRatings = false; // show rating options
  bool showPrices = false; // show price options

  List<String> typesOfCuisines = ["American", "Asian", "British", "Chinese",
    "Greek", "Grocery", "Indian", "Italian", "Japanese", "Korean", "Mediterranean",
    "Mexican", "Thai", "Turkish"]; // fetch from db
  List<double> typesOfRatings = [3.0, 3.5, 4.0, 4.5, 5.0];
  List<String> typesOfPrices = ["£", "££", "£££"];

  Map<String, bool> cuisinesValue = {}; // stores cuisine -> checked?
  Map<double, bool> ratingsValue = {}; // stores rating -> checked?
  Map<String, bool> pricesValue = {}; // stores price -> checked?


  double? currentRating;

  @override
  void initState() {
    super.initState();

    cuisinesValue = { for (var cuisine in typesOfCuisines) cuisine : false };
    ratingsValue = { for (var rating in typesOfRatings) rating : false };
    pricesValue = { for (var price in typesOfPrices) price : false };
  }

  void changeShowCuisines(){
    setState(() {
      showCuisines = !showCuisines;
    });
  }

  void changeShowRatings(){
    setState(() {
      showRatings = !showRatings;
    });
  }

  void changeShowPrices(){
    setState(() {
      showPrices = !showPrices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Table Side'),
        body: Container(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // side bar
              Expanded(
                  flex:2,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // search bar
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                            child: SearchBar(
                              hintText: "Search for a restaurant...",
                              leading: const Icon(Icons.search),
                              controller: searchController,
                              onSubmitted: (text){
                                /*
                                TODO: how do we want to do the search?
                               */
                              },
                            ),
                          ),

                          // type of cuisine
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: GestureDetector(
                                onTap: () {setState(() {
                                  showCuisines = !showCuisines;
                                });},
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            color: Colors.white,
                                            child:const Text("Cuisines", style: TextStyle(fontWeight: FontWeight.bold),),
                                          ),
                                        )
                                      ],
                                    ),
                                    showCuisines
                                        ? Column(
                                      children:
                                      typesOfCuisines.map((cuisine) =>
                                          MyCheckbox(
                                            checkboxText: cuisine,
                                            value: cuisinesValue[cuisine],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                cuisinesValue[cuisine] = value ?? false;
                                              });
                                            },  ))
                                          .toList(),
                                    )
                                        : const SizedBox.shrink(),
                                    const Divider(),
                                  ],
                                )
                            ),
                          ),

                          // price
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: GestureDetector(
                                onTap: () {setState(() {
                                  showPrices = !showPrices;
                                });},
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            color: Colors.white,
                                            child:const Text("Prices", style: TextStyle(fontWeight: FontWeight.bold),),
                                          ),
                                        )
                                      ],
                                    ),
                                    showPrices
                                        ? Column(
                                      children:
                                      typesOfPrices.map((price) =>
                                          MyCheckbox(
                                            // title: Text(cuisine),
                                            checkboxText: price,
                                            value: pricesValue[price],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                pricesValue[price] = value ?? false;
                                              });
                                            },  ))
                                          .toList(),
                                    )
                                        : const SizedBox.shrink(),
                                    const Divider(),
                                  ],
                                )
                            ),
                          ),

                          // rating
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: GestureDetector(
                                onTap: () {setState(() {
                                  showRatings = !showRatings;
                                });},
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            color: Colors.white,
                                            child:const Text("Ratings", style: TextStyle(fontWeight: FontWeight.bold),),
                                          ),
                                        )
                                      ],
                                    ),
                                    showRatings
                                        ? Column(
                                      children:
                                      typesOfRatings.map((rating) =>
                                          ListTile(
                                              title: Text("$rating+"),
                                              leading: Radio(
                                                value: rating,
                                                groupValue: currentRating,
                                                onChanged: (value){
                                                  setState(() {
                                                    currentRating = value;
                                                  });
                                                },
                                              )
                                          ))
                                          .toList(),
                                    )
                                        : const SizedBox.shrink(),
                                    const Divider(),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),

              // main column for restaurants
              Expanded(
                flex:8,
                child: Column(
                  children: [
                    Expanded(
                        flex:3,
                        child: Container(
                          // color: Colors.purple,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Recent Restaurants",
                                  style: TextStyle(fontSize: 40),
                                ),
                                const SizedBox(height: 10,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: [
                                        for(var i = 0; i < 30; i++) //todo: for all restaurants, display option card
                                          RestaurantCard(
                                            label: "McDonalds",
                                            cuisine: "American", // can probably just use restaurant object instead of splitting it up here
                                            rating:4.5,
                                            onTap: (){}, //TODO: navigate to restaurant specific page
                                            height: 165,
                                            width: 200,
                                          ), //TODO: need to pass in restaurant details
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        flex: 7,
                        child: Container(
                          // color: Colors.orange,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // title
                                const Text(
                                  "All Restaurants",
                                  style: TextStyle(fontSize: 40),
                                ),

                                const SizedBox(height: 10,),

                                // list of restaurants
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Wrap(
                                      children: [
                                        for(var i = 0; i < 30; i++) Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: RestaurantCard(
                                            label: "McDonalds",
                                            cuisine: "American",
                                            rating:4.5,
                                            onTap: (){}, //TODO: navigate to restaurant specific page
                                            height: 250,
                                            width: 350,
                                          ), //TODO: need to pass in restaurant details
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

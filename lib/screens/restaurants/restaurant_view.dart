import 'package:flutter/material.dart';

// TODO: ALL VALUES HARDCODED ATM NEEDS TO BE CHANGED TO USE VALUES FROM DB

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurant Name",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xff5603AD),
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: MaterialButton(
              onPressed: () {
                // TODO: Redirect to profile screen
              },
              child: const Row(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: const Color(0xff5603AD),
                    onPressed: () {
                      // TODO: Redirect to book a table form/screen
                    },
                    minWidth: MediaQuery.of(context).size.width * 0.2,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Book A Table",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 100),
                  MaterialButton(
                    color: const Color(0xff5603AD),
                    onPressed: () {
                      // TODO: Redirect to order form/screen
                    },
                    // minWidth: 300,
                    minWidth: MediaQuery.of(context).size.width * 0.2,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "About Us",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 15),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: const Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed "
                                        "do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                        "Aliquet risus feugiat in ante metus dictum at tempor. Lobortis "
                                        "elementum nibh tellus molestie nunc non blandit massa.",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: const Color(0xff5603AD)
                                        .withOpacity(0.2),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.55,
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Opening Times",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text("this will be the times"),
                                          SizedBox(height: 15),
                                          Text(
                                            "Location",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text("this will be the location"),
                                          SizedBox(height: 15),
                                          Text(
                                            "Type of Cuisine",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                              "this will be the type of cuisine served"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // height: 600,
                        // width: 1200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

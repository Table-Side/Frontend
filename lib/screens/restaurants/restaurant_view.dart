import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/screens/restaurants/order.dart';

class RestaurantView extends StatefulWidget {
  const RestaurantView({super.key});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  String numberOfPeople = "1"; // TODO: change type if needed
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  // display time picker
  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.inputOnly,
  //   );
  //   if (picked != null && picked != selectedTime) {
  //     setState(() {
  //       selectedTime = picked;
  //     });
  //   }
  // }

  // display calendar
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2015, 8),
  //     lastDate: DateTime(2101),
  //     initialEntryMode: DatePickerEntryMode.calendarOnly,
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO(A): GET DATA FROM DB
      appBar: const CustomAppBar(text: "Restaurant Name"),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: purpleColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderForm(),
                        ),
                      );
                    },
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "About Us",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 15),
                                        Expanded(
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: const [
                                                // TODO(A): GET DATA FROM DB
                                                Text(
                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed "
                                                  "do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                                  "Aliquet rises feugiat in ante metus dictum at tempor. Lobortis "
                                                  "elementum nibh tellus molestie nunc non blandit massa.",
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: purpleColor.withOpacity(0.2),
                                      width: constraints.maxWidth * 0.45,
                                      height: constraints.maxHeight * 0.85,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ListView(
                                                shrinkWrap: false,
                                                children: const [
                                                  Text(
                                                    "Opening Times",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // TODO(A): GET DATA FROM DB
                                                  Text(
                                                      "this will be the times"),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    "Location",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // TODO(A): GET DATA FROM DB
                                                  Text(
                                                      "this will be the location"),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    "Type of Cuisine",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // TODO(A): GET DATA FROM DB
                                                  Text(
                                                      "this will be the type of cuisine served"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
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

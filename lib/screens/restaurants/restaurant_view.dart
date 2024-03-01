import 'dart:math';

import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';

// TODO: ALL VALUES HARDCODED ATM NEEDS TO BE CHANGED TO USE VALUES FROM DB

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
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // display calendar
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "Restaurant Name"),
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
                      showDialog(
                          context: context,
                          builder: (final context) =>
                              AlertDialog(
                                title: const Text("Book a table"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text("Select the date", style: TextStyle(fontSize: 20)),
                                      ),
                                    ),


                                    MaterialButton(
                                      onPressed: () {
                                        _selectTime(context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text(
                                          "Select the time",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                        height: 50.0,
                                        width: 200.0,
                                        child: DropdownButton(
                                          value: numberOfPeople,
                                          icon: const Icon(Icons.arrow_downward),
                                          iconSize: 24,
                                          elevation: 16,
                                          isExpanded: true,
                                          style: const TextStyle(color: Colors.deepPurple, fontSize: 20.0),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              numberOfPeople = newValue ?? "1";
                                            });
                                          },
                                          items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        )
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child: MaterialButton(
                                            height: 60,
                                            color: const Color(0xff5603AD),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Cancel", style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child: MaterialButton(
                                            height: 60,
                                            color: const Color(0xff5603AD),
                                            onPressed: (){
                                              // TODO: API call with date, time, number of people, and user name
                                              // POST request
                                            },
                                            child: const Text("Book!", style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                      );
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

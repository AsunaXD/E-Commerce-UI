import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> selectedItems = [
    false,
    false,
    false,
    false
  ]; // Track checkbox state

  List imagesList = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.jpg",
  ];
  List productTitles = [
    "Warm Zippers",
    "Knitted Wool",
    "Zipper Win",
    "Child Win",
  ];
  List<double> prices = [
    300,
    550,
    65,
    100,
  ];
  // List to track the quantity of each item
  List<int> quantities = [1, 1, 1, 1]; // Corrected the tracking of quantities
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart "),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.builder(
                itemCount: imagesList.length,
                shrinkWrap: true, // Shrinks the list to fit content
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  double totalPrice = prices[index] * quantities[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          splashRadius: 20,
                          activeColor: Color(0xFFEF6969),
                          value: selectedItems[index], // Use dynamic state
                          onChanged: (val) {
                            setState(() {
                              selectedItems[index] = val!;
                            });
                          },
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                          child: Image.asset(
                            imagesList[index],
                            height: 80,
                            width: 80,
                            fit: BoxFit
                                .cover, // Set a fixed height for the images
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productTitles[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Hoodie Jacket",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Display the formatted price as a string with the currency symbol
                            Text(
                              "\$${totalPrice.toStringAsFixed(2)}", // Format the price to 2 decimal places
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF6969),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantities[index] > 1) {
                                    quantities[index]--; // Decrease quantity
                                  }
                                });
                              },
                              child: Icon(
                                CupertinoIcons.minus,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              quantities[index].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantities[index]++; // Increase quantity
                                  });
                                },
                                child: Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.red,
                                )),
                            // SizedBox(
                            //   width: 8,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

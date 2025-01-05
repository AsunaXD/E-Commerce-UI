import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> selectedItems = [false, false, false, false];
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
    "Child Win"
  ];
  List<double> prices = [300, 550, 65, 100];
  List<int> quantities = [1, 1, 1, 1];

  Timer? _decreaseTimer;
  Timer? _increaseTimer;

  // Calculate the total price
  double getTotalPrice() {
    double total = 0.0;
    for (int i = 0; i < prices.length; i++) {
      total += prices[i] * quantities[i];
    }
    return total;
  }

//Decreasing logic for Minus Icon
  void startRapidDecrease(int index) {
    _decreaseTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (quantities[index] > 1) {
        setState(() {
          quantities[index]--;
        });
      } else {
        timer.cancel();
      }
    });
  }

//Increasing logic for Added Icon
  void stopRapidDecrease() {
    _decreaseTimer?.cancel();
  }

  void startRapidIncrease(int index) {
    _increaseTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        quantities[index]++;
      });
    });
  }

  void stopRapidIncrease() {
    _increaseTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
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
                shrinkWrap: true,
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
                          value: selectedItems[index],
                          onChanged: (val) {
                            setState(() {
                              selectedItems[index] = val!;
                            });
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagesList[index],
                            height: 95,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
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
                            SizedBox(height: 10),
                            Text(
                              "Hoodie Jacket",
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "\$${totalPrice.toStringAsFixed(2)}",
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
                                    quantities[index]--;
                                  }
                                });
                              },
                              onLongPress: () {
                                startRapidDecrease(index);
                              },
                              onLongPressUp: () {
                                stopRapidDecrease();
                              },
                              child: Icon(
                                CupertinoIcons.minus,
                                size: 20,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              quantities[index].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantities[index]++;
                                });
                              },
                              onLongPress: () {
                                startRapidIncrease(index);
                              },
                              onLongPressUp: () {
                                stopRapidIncrease();
                              },
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                "Total: \$${getTotalPrice().toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

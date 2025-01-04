import 'package:e_commerce_ui/SCreens/cart_screen.dart';
import 'package:e_commerce_ui/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPopup extends StatelessWidget {
  final iStyle = TextStyle(
    color: Colors.black87,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final List<Color> clrs = [
    Colors.red,
    Colors.purple,
    Colors.pink,
    Colors.amberAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            // State management for the bottom sheet
            String selectedSize = "M"; // Default selected size
            Color selectedColor = clrs[0]; // Default selected color
            int quantity = 1; // Default quantity
            double pricePerItem = 40.0; // Price of a single item

            return StatefulBuilder(
              builder: (context, setState) => Container(
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Size:",
                                style: iStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Color:",
                                style: iStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Quantity:",
                                style: iStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Text(
                              //   "Total:",
                              //   style: iStyle,
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Size Selection
                              Row(
                                children: [
                                  for (var size in ["S", "M", "L", "XL"])
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedSize = size;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: selectedSize == size
                                                  ? Colors.blue
                                                  : Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            size,
                                            style: iStyle.copyWith(
                                              fontSize: 14,
                                              color: selectedSize == size
                                                  ? Colors.blue
                                                  : Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              // Color Selection
                              Row(
                                children: [
                                  for (var i = 0; i < clrs.length; i++)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = clrs[i];
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                          color: clrs[i],
                                          border: Border.all(
                                            color: selectedColor == clrs[i]
                                                ? Colors.blue
                                                : Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Quantity Selection with + and -
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                  Text(
                                    '$quantity',
                                    style: iStyle,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Total Payment Calculation
                      // SizedBox(
                      //   height: 8,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Payment",
                            style: iStyle,
                          ),
                          Text(
                            "\$${(quantity * pricePerItem).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF6969),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ));
                        },
                        child: ContainerButtonModel(
                          containerWidth: MediaQuery.of(context).size.width,
                          itext: "Checkout",
                          bgColor: Color(0xFFEF6969),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Buy Now",
        bgColor: Color(0xFFEF6969),
      ),
    );
  }
}

import 'package:e_commerce_ui/SCreens/cart_screen.dart';
import 'package:e_commerce_ui/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPopup extends StatelessWidget {
  final String name; // Add this
  final double price; // Add this

  final TextStyle iStyle = const TextStyle(
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

  ProductDetailsPopup({
    required this.name, // Initialize in constructor
    required this.price, // Initialize in constructor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            String selectedSize = "M";
            Color selectedColor = clrs[0];
            int quantity = 1;

            return StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: MediaQuery.of(context).size.height / 2.32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display Product Name and Price
                        Row(
                          children: [
                            Text(
                              name, // Use the dynamic product name
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 130),
                            Text(
                              "\$${price.toStringAsFixed(2)}", // Use the dynamic price
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF6969),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Size, Color, Quantity Selection
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Size:", style: iStyle),
                                const SizedBox(height: 20),
                                Text("Color:", style: iStyle),
                                const SizedBox(height: 20),
                                Text("Quantity:", style: iStyle),
                              ],
                            ),
                            const SizedBox(width: 0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Size Selection
                                Row(
                                  children: List.generate(
                                    ["S", "M", "L", "XL"].length,
                                    (index) {
                                      String size =
                                          ["S", "M", "L", "XL"][index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedSize = size;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          padding: const EdgeInsets.all(8),
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
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 6),
                                // Color Selection
                                Row(
                                  children: List.generate(clrs.length, (i) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = clrs[i];
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
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
                                    );
                                  }),
                                ),
                                const SizedBox(height: 10),
                                // Quantity Selector
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
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
                                      icon: const Icon(Icons.add),
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
                        SizedBox(
                          height: 10,
                        ),
                        // Total Payment
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Payment", style: iStyle),
                            Text(
                              "\$${(quantity * price).toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF6969),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Checkout Button
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(
                                    // selectedSize: selectedSize,
                                    // selectedColor: selectedColor,
                                    // quantity: quantity,
                                    ),
                              ),
                            );
                          },
                          child: ContainerButtonModel(
                            containerWidth: MediaQuery.of(context).size.width,
                            itext: "Checkout",
                            bgColor: const Color(0xFFEF6969),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Buy Now",
        bgColor: const Color(0xFFEF6969),
      ),
    );
  }
}

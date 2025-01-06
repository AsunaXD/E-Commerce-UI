import 'package:e_commerce_ui/SCreens/shipping_address.dart';
import 'package:e_commerce_ui/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount; // Total payment amount
  final List<bool> selectedProducts; // Selected products list

  const PaymentScreen({
    super.key,
    required this.totalAmount,
    required this.selectedProducts,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _type = 1;
  final double _shippingFee = 15; // Fixed shipping fee

  void handleradio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    // Fixed typo from "initsate" to "initState"
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalPayment =
        widget.totalAmount + _shippingFee; // Calculate total payment

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: _type == 1
                          ? Border.all(
                              width: 1,
                              color: Color(0xFFEF6969),
                            )
                          : Border.all(
                              width: 0.3,
                              color: Colors.grey,
                            ),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: handleradio,
                                  activeColor: Color(0xFFEF6969),
                                ),
                                Text(
                                  "AmazonPay",
                                  style: _type == 1
                                      ? TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/Amazonpay.png",
                              width: 90,
                              height: 90,
                              // fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(
                              width: 1,
                              color: Color(0xFFEF6969),
                            )
                          : Border.all(
                              width: 0.3,
                              color: Colors.grey,
                            ),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: handleradio,
                                  activeColor: Color(0xFFEF6969),
                                ),
                                Text(
                                  "Google Pay",
                                  style: _type == 2
                                      ? TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/icon2.png",
                              width: 50,
                              height: 50,
                              // fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: _type == 3
                          ? Border.all(
                              width: 1,
                              color: Color(0xFFEF6969),
                            )
                          : Border.all(
                              width: 0.3,
                              color: Colors.grey,
                            ),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _type,
                                  onChanged: handleradio,
                                  activeColor: Color(0xFFEF6969),
                                ),
                                Text(
                                  "Credit Card",
                                  style: _type == 3
                                      ? TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/icon2.png",
                              width: 50,
                              height: 50,
                              // fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: _type == 4
                          ? Border.all(
                              width: 1,
                              color: Color(0xFFEF6969),
                            )
                          : Border.all(
                              width: 0.3,
                              color: Colors.grey,
                            ),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: _type,
                                  onChanged: handleradio,
                                  activeColor: Color(0xFFEF6969),
                                ),
                                Text(
                                  "UPI",
                                  style: _type == 4
                                      ? TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)
                                      : TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "images/icon2.png",
                              width: 50,
                              height: 50,
                              // fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub-Total",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$${widget.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping fee",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$${_shippingFee.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$${totalPayment.toStringAsFixed(2)}", // Dynamically calculate and display total payment
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFEF6969),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShippingAddress(),
                        ),
                      );
                    },
                    child: ContainerButtonModel(
                      itext: "Confirm Payment",
                      containerWidth: MediaQuery.of(context).size.width,
                      bgColor: Color(0xFFEF6969),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

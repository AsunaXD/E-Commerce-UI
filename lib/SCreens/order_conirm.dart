import 'package:flutter/material.dart';

class OrderConirm extends StatefulWidget {
  final String fullName;
  final String mobileNumber;
  final String address;
  final String state;
  final String city;
  final String pinCode;
  final String country;

  const OrderConirm({
    super.key,
    required this.fullName,
    required this.mobileNumber,
    required this.address,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.country,
  });

  @override
  State<OrderConirm> createState() => _OrderConirmState();
}

class _OrderConirmState extends State<OrderConirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Confirm"),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),

                // Display Shipping Address
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${widget.fullName}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Mobile: ${widget.mobileNumber}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Address: ${widget.address}, ${widget.city}, ${widget.state}, ${widget.country}, ${widget.pinCode}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 0),

                // Address Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate back to Shipping Address Screen
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Change Address",
                      style: TextStyle(color: Color(0xFFEF6969)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

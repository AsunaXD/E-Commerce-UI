import 'package:e_commerce_ui/SCreens/order_conirm.dart';
import 'package:e_commerce_ui/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

//transfer the address to confirm Screen
class _ShippingAddressState extends State<ShippingAddress> {
  // Controllers for the input fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _fullNameController.dispose();
    _mobileNumberController.dispose();
    _addressController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _pinCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shipping Address"),
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
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Full Name",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Mobile Number",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Address",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "State/Region",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "City",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pinCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Pin Code",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Country",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderConirm(
                          fullName: _fullNameController.text,
                          mobileNumber: _mobileNumberController.text,
                          address: _addressController.text,
                          state: _stateController.text,
                          city: _cityController.text,
                          pinCode: _pinCodeController.text,
                          country: _countryController.text,
                        ),
                      ),
                    );
                  },
                  child: ContainerButtonModel(
                    itext: "Add Address",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: Color(0xFFEF6969),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

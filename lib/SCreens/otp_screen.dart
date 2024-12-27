import 'package:e_commerce_ui/SCreens/otp_verify_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Please Enter your email address you will recieve a link to create or set a new password via email",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter Number "),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerifyScreen(),
                    ),
                  );
                },
                child: Text(
                  "Send Code",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xFFEF6969),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

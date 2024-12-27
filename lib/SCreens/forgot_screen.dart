import 'package:e_commerce_ui/SCreens/otp_screen.dart';
import 'package:e_commerce_ui/SCreens/recoveryscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgotscreen extends StatefulWidget {
  const Forgotscreen({super.key});

  @override
  State<Forgotscreen> createState() => _ForgotscreenState();
}

class _ForgotscreenState extends State<Forgotscreen> {
  bool clrbutton = false;
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Please Enter your email address you will recieve a link to create or set a new password via email",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailcontroller,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      clrbutton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Enter Email",
                  border: OutlineInputBorder(),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        emailcontroller.clear();
                      });
                    },
                    child: Icon(
                      CupertinoIcons.multiply,
                      color: Color(0XFFEF6969),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Recoveryscreen(),
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
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Verifing Using Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFFEF6969),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set background color for the column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align to the top
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
          Image.asset("assets/koushy.jpeg",height: 200,width:200),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20), // Add spacing between form fields
                    TextFormField(
                      decoration: InputDecoration(

                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.grey), // Greyish hint text
                        filled: true,
                        fillColor: Colors.grey.shade200, // Light greyish background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded rectangle
                          borderSide: BorderSide.none, // Remove the border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded rectangle when focused
                          borderSide: const BorderSide(color: Colors.grey), // Grey border when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded rectangle when enabled
                          borderSide: const BorderSide(color: Colors.transparent), // No border when enabled
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress, // Keyboard optimized for email input
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20), // Addspacing between form fields
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.grey), // Greyish hint text
                        filled: true,
                        fillColor: Colors.grey.shade200, // Light greyish background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded rectangle
                          borderSide: BorderSide.none, // Remove the border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded rectangle when focused
                          borderSide: const BorderSide(color: Colors.grey), // Grey border when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded rectangle when enabled
                          borderSide: const BorderSide(color: Colors.transparent), // No border when enabled
                        ),
                      ),
                      obscureText: true, // Hide password text
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Wrong password';
                        }
                        return null;
                      },
                    ),



                    SizedBox(height: 20,),
                    SizedBox(
                      width: 130,
                      height: 20,
                      child: TextButton(
                        onPressed: () {},
                        child:  Text(
                          "Forgot Your Password?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.green[300], // Greenish color
                            decoration: TextDecoration.underline, // Underlined text
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove extra padding
                          minimumSize: Size(130, 20), // Ensure the button maintains size
                          alignment: Alignment.center, // Center the text
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()), // Navigate to Signup screen
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, // Ensure padding doesn't affect the image size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text("login")
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
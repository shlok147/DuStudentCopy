import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transportaion1 extends StatefulWidget {
  const Transportaion1({super.key});

  @override
  State<Transportaion1> createState() => _Transportaion1State();
}

class _Transportaion1State extends State<Transportaion1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black, title: Text("Hello")),
        body: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      "Bus Pass",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "Receipt",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 12,
                      child: Text(
                        "6",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      backgroundColor: Colors.blueGrey.shade700,
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(-145, -5),
                child: Container(width: 70, height: 2, color: Colors.black),
              ),
              Container(
                // height: 500,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/image/transport1.jpg",
                        fit: BoxFit.fill,
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 250,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Active",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 106,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("    Bus Pass No."),
                              Text("25/S/70AC/002"),
                            ],
                          ),
                        ),
                      ),
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

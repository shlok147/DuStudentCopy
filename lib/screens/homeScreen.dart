import 'dart:async';
import 'dart:math';
import 'package:dustudent/comps/pagecreate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {

  PageController _pageController = PageController(
    viewportFraction: 0.5,
  );
  late AnimationController _controller;
  late Timer _timer;


  final List<Widget> _originalPages = [
    buildpage(title: " Transpot Registrationfor A.Y. 2025-26",icon: Icon(Icons.notifications_active_rounded),subtitle: "Dear Charola Shlok Harishkumar",),
    buildpage(title: " ReAssesment Result Declared of BSC-it Semenster -4 Regular Exam",icon: Icon(Icons.notifications_active_rounded),subtitle: "ReAssesment Result Declared Of DU - B.Sc.(IT)Semester - 4 Regular Summer -2025"),
  ];

  int _initialPage = 1000; // Start somewhere in the middle
  int _currentPage = 1000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 5000),
          curve: Curves.easeInOut,
        );
      }
    });
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat(); // Repeat forever
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          scrolledUnderElevation: 4.0,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/image/profilephoto.png"),
                radius: 22,
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return ShaderMask(
                        shaderCallback: (bounds) {
                          final width = bounds.width;
                          return LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.yellow,
                              Colors.red,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            // Shift gradient to simulate movement
                            transform: GradientRotation(2 * pi * _controller.value),
                          ).createShader(Rect.fromLTWH(0, 0, width, bounds.height));
                        },
                        child: Text(
                          'HI NAME',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Needed for ShaderMask to work
                          ),
                        ),
                      );
                    },
                  ),

                  Text(
                    "TEMP",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ),
        endDrawer: Drawer(backgroundColor: Colors.black),
        body: ListView(
          children: [
            // Container(
            //   height: 140,
            //   width: MediaQuery.of(context).size.width,
            //   child: PageView.builder(
            //     controller: _pageController,
            //     itemBuilder: (context, index) {
            //       // Loop through original pages using modulus
            //       int pageIndex = index % _originalPages.length;
            //       return _originalPages[pageIndex];
            //     },
            //     onPageChanged: (index) {
            //       _currentPage = index;
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 12,right: 12),
              child: Row(
                children: [
                  Image.asset("assets/Icons/attendance2.png",height: 30,width: 30,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Attendance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(
                    width: 190,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}

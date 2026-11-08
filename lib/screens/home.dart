import 'dart:math';
import 'package:dustudent/screens/try.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dustudent/screens/transport.dart';

// --------------------------- MAIN APP ---------------------------
class CollegeDashboardApp extends StatelessWidget {
  const CollegeDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Dashboard',
      theme: ThemeData(
        primaryColor: const Color(0xFF1B5E20),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const DashboardPage(),
    );
  }
}

// --------------------------- DASHBOARD PAGE ---------------------------
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var activityList = [
    {"date": "06-11-2025", "activity": "Practical Term End Examination/ Viva"},
    {"date": "08-11-2025", "activity": "Attendance Review - II"},
    {"date": "08-11-2025", "activity": "Attendance Review - I"},
  ];

  var Otherlist = [
    {"t": "Transport", "i": "assets/others/1.png"},
    {"t": "Result", "i": "assets/others/2.png"},
    {"t": "Feedback", "i": "assets/others/3.png"},
    {"t": "LMS Test Res...", "i": "assets/others/4.png"},
    {"t": "Punishment", "i": "assets/others/5.png"},
    {"t": "Grievance Re...", "i": "assets/others/6.png"},
    {"t": "Settings", "i": "assets/others/7.png"},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); // gradient animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------------- AppBar ----------------------
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/image/profilephoto.png"),
              radius: 22,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: const [
                            Colors.orange,
                            Colors.yellow,
                            Colors.red,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          transform: GradientRotation(
                            2 * pi * _controller.value,
                          ),
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'HI Charola Shlok Harishkumar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 5),
                const Text(
                  "BCA/BSIT-5A |  Roll No. 405  | Batch  7",
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      endDrawer: Drawer(),
      // ---------------------- Body ----------------------
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 19,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Attendance Section
                    ListTile(
                      title: Transform.translate(
                        offset: Offset(-30, -10),
                        child: Text(
                          "Attendance",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      leading: Transform.translate(
                        offset: Offset(-20, -10),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            "assets/Icons/attendance2.png",
                          ),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: Offset(25, -10),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       "assets/Icons/attendance2.png",
                    //       height: 30,
                    //       width: 30,
                    //     ),
                    //     Text(
                    //       "Attendance",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 211,
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.black,
                    //         size: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 2),
                    Transform.translate(
                      offset: Offset(00, -17),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.teal.shade400.withAlpha(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Semester",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.teal.shade900,
                                    ),
                                  ),
                                  Text(
                                    "5",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.teal.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "A.Y. ",
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        " 2025-26 - Odd",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 225,
                                        child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey,
                                          color: Colors.blue,
                                          value: 0.9214,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.green,
                                              ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "92.14%",
                                        style: GoogleFonts.poppins(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Timetable Section
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       "assets/image/timetable.png",
                    //       height: 30,
                    //       width: 30,
                    //     ),
                    //     Text(
                    //       "Time Table",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 218,
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.black,
                    //         size: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ListTile(
                      title: Transform.translate(
                        offset: Offset(-30, -15),
                        child: Text(
                          "Time Table",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      leading: Transform.translate(
                        offset: Offset(-20, -15),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            "assets/image/timetable.png",
                          ),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: Offset(25, -15),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(00, -25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(10, 10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "01/11",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 2),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.elliptical(10, 10),
                                    ),
                                  ),
                                  child: Text(""),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "No TimeTable",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.3),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Upcoming Academic Activities
                    ListTile(
                      title: Transform.translate(
                        offset: Offset(-30, -25),
                        child: Text(
                          "Upcoming Academic Activities",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.5,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      leading: Transform.translate(
                        offset: Offset(-20, -25),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            "assets/image/timetable.png",
                          ),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: Offset(25, -25),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       "assets/image/timetable.png",
                    //       height: 30,
                    //       width: 30,
                    //     ),
                    //     Text(
                    //       "Upcoming Academic Activities",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 52,
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.black,
                    //         size: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 4),
                    Transform.translate(
                      offset: Offset(0, -35),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            // Item 0
                            Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.teal.shade400.withAlpha(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                          color: Colors.green.shade800,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          activityList[0]["date"].toString(),
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: Color(0xFF148055),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        activityList[0]["activity"].toString(),
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF148055),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.1),
                              height: 1,
                              thickness: 0.5,
                              indent: 8,
                              endIndent: 8,
                            ),

                            // Item 1
                            Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.teal.shade400.withAlpha(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                          color: Colors.green.shade800,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          activityList[1]["date"].toString(),
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: Color(0xFF148055),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        activityList[1]["activity"].toString(),
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF148055),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.1),
                              height: 1,
                              thickness: 0.5,
                              indent: 8,
                              endIndent: 8,
                            ),

                            // Item 2
                            Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.teal.shade400.withAlpha(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                          color: Colors.green.shade800,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          activityList[2]["date"].toString(),
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: Color(0xFF148055),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        activityList[2]["activity"].toString(),
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF148055),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.1),
                              height: 1,
                              thickness: 0.5,
                              indent: 8,
                              endIndent: 8,
                            ),
                          ],
                        ),
                      ),
                    ),

                    ListTile(
                      title: Transform.translate(
                        offset: Offset(-30, -25),
                        child: Row(
                          children: [
                            Text(
                              "LMS",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.redAccent.shade100.withOpacity(
                                  0.2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 2.0,
                                  bottom: 2.0,
                                  left: 5,
                                  right: 5,
                                ),
                                child: Center(
                                  child: Text(
                                    "Sem - 5",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      leading: Transform.translate(
                        offset: Offset(-20, -25),
                        child: CircleAvatar(
                          radius: 18,
                          child: Image.asset(
                            "assets/image/open-book.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                          // backgroundImage: AssetImage("assets/image/open-book.png",),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: Offset(25, -30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       "assets/image/timetable.png",
                    //       height: 30,
                    //       width: 30,
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text(
                    //           "LMS",
                    //           style: GoogleFonts.poppins(
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 16,
                    //           ),
                    //         ),
                    //         SizedBox(width: 8),
                    //         Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.redAccent.shade100.withOpacity(0.2),
                    //             borderRadius: BorderRadius.circular(5),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //               top: 2.0,
                    //               bottom: 2.0,
                    //               left: 5,
                    //               right: 5,
                    //             ),
                    //             child: Center(
                    //               child: Text(
                    //                 "Sem - 5",
                    //                 style: GoogleFonts.poppins(
                    //                   fontWeight: FontWeight.w600,
                    //                   fontSize: 10,
                    //                   color: Colors.red,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //
                    //     Container(
                    //       width: 218,
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.black,
                    //         size: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // LMS Section
                    Transform.translate(
                      offset: Offset(0, -38),
                      child: SizedBox(
                        height: 85,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: const [
                            lms(title: "Mobile Programming   using Flutter"),
                            lms(title: "Career     Orientation"),
                            lms(title: "Java Script Frameworks"),
                            lms(title: "Computer Algorithm"),
                            lms(title: "Introduction to Advanced Technologies"),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 130,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     physics: BouncingScrollPhysics(),
                    //     children: const [
                    //       lms(title: "Mobile Programming using Flutter"),
                    //       lms(title: "Career Orientation"),
                    //       lms(title: "Java Frameworks"),
                    //       lms(title: "Computer Algorithm"),
                    //       lms(title: "Introduction to Advanced Technologies"),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 10),

                    // Mentor Section
                    // Row(
                    //   children: [
                    //     Image.asset("assets/image/mentor.png", height: 30, width: 30),
                    //     Text(
                    //       "Current Mentor",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 182.5,
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.black,
                    //         size: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Transform.translate(
                      offset: Offset(0, -12),
                      child: ListTile(
                        title: Transform.translate(
                          offset: Offset(-30, -25),
                          child: Text(
                            "Current Mentor",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        leading: Transform.translate(
                          offset: Offset(-20, -25),
                          child: CircleAvatar(
                            radius: 18,
                            child: Image.asset(
                              "assets/image/mentor.png",
                              height: 30,
                            ),
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                        trailing: Transform.translate(
                          offset: Offset(25, -25),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -45),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 92,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 8,
                              top: 15,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(
                                  'assets/image/umesh.jpg',
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 90,
                              child: Text(
                                "Mr. Umeshkumar H Thoriya",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 90,
                              child: Text(
                                "CSE | Assistant Professor | C-202",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 300,
                              child: SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 13,
                                      child: Icon(
                                        Icons.phone,
                                        size: 13,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(width: 12),
                                    CircleAvatar(
                                      radius: 13,
                                      child: Icon(
                                        Icons.email,
                                        size: 13,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.grey.shade600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Others
                    // Row(
                    //   children: [
                    //     SizedBox(width: 5),
                    //     Image.asset("assets/image/other.png", height: 20, width: 20),
                    //     SizedBox(width: 10),
                    //     Text(
                    //       "Other",
                    //       style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     Container(
                    //       width: 258,
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.black,
                    //         size: 15,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ListTile(
                      title: Transform.translate(
                        offset: Offset(-30, -25),
                        child: Text(
                          "Other",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      leading: Transform.translate(
                        offset: Offset(-20, -25),
                        child: CircleAvatar(
                          radius: 18,
                          child: Image.asset(
                            "assets/image/other.png",
                            height: 20,
                          ),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: Offset(25, -25),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -35),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 225,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                              ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                left: 5,
                                right: 5,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Transport(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Otherlist[index]["i"].toString(),
                                        height: 40,
                                        width: 40,
                                      ),
                                      Text(
                                        Otherlist[index]["t"].toString(),
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.7),
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: Otherlist.length,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 72,
                    // )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "App Version:",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.grey,
                          letterSpacing: 0.6,
                        ),
                      ),
                      Text(
                        " 1.0.8",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------- LMS CARD WIDGET ----------------------

class lms extends StatelessWidget {
  final String title;

  const lms({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.elliptical(10, 5)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(10, 5)),
          ),
          width: 150,
          height: 20,
          child: Stack(
            children: [
              Container(color: Colors.teal),
              Center(child: Image.asset("assets/image/lms.png", height: 55)),
              Container(color: Colors.black.withOpacity(0.55)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,

                  // Align multi-line text to start from left
                  maxLines: 3, // Optional: Limit to 3 lines
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

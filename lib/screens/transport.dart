import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onTabTap(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Transport Summary',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            color: Colors.white,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _onTabTap(0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 0
                              ? Colors.blue.shade800
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Bus Pass",
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTabTap(1),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 1
                              ? Colors.blue.shade800
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            "Receipt",
                            style: TextStyle(
                                color: _selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 15,
                            child: Text("5",style: TextStyle(color: Colors.grey.shade200,),),
                            backgroundColor: Colors.blueGrey.shade700,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) =>
                  setState(() => _selectedIndex = index),
              children: const [
                BusPassPage(),
                ReceiptPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BusPassPage extends StatelessWidget {
  const BusPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Active Tag and Pass No
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: const Text(
                          "Active",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: const Text(
                          "Bus Pass No. 25/S/70AC/002",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Pickup Point",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Kenal Road - અમની ચોકડી, કેનલ રોડ, મોરબી",
                    style:
                    TextStyle(color: Colors.black, fontSize: 15, height: 1.4),
                  ),
                  const SizedBox(height: 15),

                  const Text(
                    "Shift & Timings",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Shift-2 (Afternoon Shift) (09:50 AM to 03:40 PM)",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 15),

                  const Text(
                    "Route",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Bus No. 62 - (S2) - M-62 - Shift-2 - Morbi To University",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),

                  // Fees Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FeeColumn(
                          label: "Fees Amount",
                          value: "₹ 15,000",
                          color: Colors.blue),
                      FeeColumn(
                          label: "Fees Paid",
                          value: "₹ 15,000",
                          color: Colors.green),
                      FeeColumn(
                          label: "Pending Amount",
                          value: "₹ 0",
                          color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Date and Time
            Center(
              child: Column(
                children: const [
                  Text(
                    "24-10-2025",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "23:38:49",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Register for Transport",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          "Receipt Page\n(Design your receipt info here)",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54),
        ),
      ),
    );
  }
}

class FeeColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const FeeColumn(
      {super.key, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13)),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
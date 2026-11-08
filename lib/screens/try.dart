import 'package:flutter/material.dart';

class Trynow extends StatefulWidget {
  const Trynow({super.key});

  @override
  State<Trynow> createState() => _TrynowState();
}

class _TrynowState extends State<Trynow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Container(
        height: 50,
        width: 300,
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey,
          color: Colors.blue,
          value: 0.9214,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
          semanticsLabel: 'Linear progress indicator',
          semanticsValue: 'Linear progress indicator value',
          borderRadius: BorderRadius.circular(10),
        ),
      )),
    ));
  }
}

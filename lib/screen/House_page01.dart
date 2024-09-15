import 'package:flutter/material.dart';
import '../jsonsdudy/JsonParse.dart';
class HousePage01 extends StatefulWidget {
  const HousePage01({super.key});

  @override
  State<HousePage01> createState() => _HousePage01State();
}

class _HousePage01State extends State<HousePage01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '뭐지'
        ),
      ),
      body: const JsonParse(),      
    );
  }
}
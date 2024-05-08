import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({
    super.key,
  });

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 500,
      width: MediaQuery.of(context).size.width,
    );
  }
}
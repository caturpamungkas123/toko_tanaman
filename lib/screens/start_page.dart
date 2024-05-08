import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toko_tanaman/screens/main_page.dart';
import 'package:toko_tanaman/utils/collor_util.dart';

class StratPage extends StatefulWidget {
  const StratPage({super.key});

  @override
  State<StratPage> createState() => _StratPageState();
}

class _StratPageState extends State<StratPage> {
  @override
  Widget build(BuildContext context) {
    double x = 250;
    double y = 130;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(x, y), bottomRight:  Radius.elliptical(x, y),),
                ),

                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                child: Transform.translate(
                  offset: const Offset(0, 30),
                  child: Image.asset("assets/images/tanaman_icon.png")),
              ),
            Text("Create Your Own Garden!", textAlign: TextAlign.center, style: TextStyle(color: textColor, fontSize: 35, fontWeight: FontWeight.bold),),
            ElevatedButton.icon(
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(buttonBg) ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),)), 
              label: const Text("Let's Start", style: TextStyle(color: Colors.white),),
              icon: const Icon(FontAwesomeIcons.circleChevronRight, color: Colors.white,), 
            ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toko_tanaman/screens/home_page.dart';
import 'package:toko_tanaman/screens/profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int selectedListCategory = 0;
  int lengData = 0;
  Future? future;

late int currentPage;
  late TabController tabController;

  @override
  void initState() {
   currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation?.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 
      body: BottomBar(
          clip: Clip.none,
          fit: StackFit.expand,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width,
          barColor: Colors.white,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              TabBar(
                //! INDICATOR KETIKA ACTIV
                indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Color(0xff475E3E),
                      width: 5,
                    ),
                    insets: EdgeInsets.fromLTRB(30, 0, 30, 5)),
                controller: tabController,
                tabs: [
                  SizedBox(
                    height: 70,
                    width: 40,
                    child: Center(
                        child: Icon(
                          size: 23,
                      FontAwesomeIcons.house,
                      color: currentPage == 0 ? const Color(0xff475E3E) : const Color(0xffD0D5DD),
                    )),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        size: 23,
                        FontAwesomeIcons.solidHeart,
                        color: currentPage == 1 ? const Color(0xff475E3E) : const Color(0xffD0D5DD),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        size: 23,
                        FontAwesomeIcons.cartShopping,
                        color: currentPage == 2 ? const Color(0xff475E3E) : const Color(0xffD0D5DD),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        size: 23,
                        FontAwesomeIcons.solidUser,
                        color: currentPage == 3 ? const Color(0xff475E3E) : const Color(0xffD0D5DD),
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: -25,
                child: CircleAvatar(
                  backgroundColor: Color(0xff475E3E),
                  radius: 25,
                  child:   Icon(FontAwesomeIcons.barcode, color: Colors.white)
                  ),
              )
            ],
          ),
          body: (context, controller) {
            return TabBarView(
              controller: tabController,
              children: [
               const HomePage1(),
                Container(
                  color: Colors.blue,
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  color: Colors.yellow,
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                ),
                const Page4(),
              ]);
          },
        ),
    );
  }
}
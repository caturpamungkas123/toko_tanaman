import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toko_tanaman/screens/home_page.dart';

class DetailProduct extends StatefulWidget {
  final int index;
  const DetailProduct({super.key, required this.index});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int totalProduct = 1;
  bool like = false;
  void addTotalProduct(){
    setState(() {
      totalProduct ++;
    });
  }
  void minTotalProduct(){
    setState(() {
      totalProduct --;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F4EF),
      body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: const Color(0xffB5C9AD),
              maxRadius: 5,
              child: IconButton(
                iconSize: 20,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),)), 
                icon: const Icon(FontAwesomeIcons.angleLeft, color: Colors.white,)),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: const Color(0xffB5C9AD),
                child: IconButton(onPressed: (){
                  setState(() {
                    like = !like;
                  });
                }, icon: Icon(FontAwesomeIcons.solidHeart, color: like ? Colors.red : Colors.white,)),
              ),
            )
          ],
          backgroundColor: const Color(0xffF0F4EF),
          expandedHeight: 516,
          //? AGAR APP BAR BERHENTI
          pinned: true,
          // ? UNTUK MENGATUR BACKGROUND GAMBAR APP BAR
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              child: SizedBox(
                //? TINGGI HARUS SAMA DENGAN expandedHeight
                height: 516,
                child: Image.asset("assets/images/tanaman-${widget.index}.jpg", fit: BoxFit.cover,)),
            ),
          ),
        ),

        // ? IBARAT SEBAGAI BODY APP BAR
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Colors.white
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  const Text("Bunga Bangkai Bau Tai", style: TextStyle(color: Color(0xff101828), fontSize: 24, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     const Text("\$27.50", style: TextStyle(color: Color(0xff475E3E), fontSize: 20, fontWeight: FontWeight.bold),),
                      Container(
                        width: 140,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xffF0F4EF),
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: const Color(0xffB5C9AD),
                              radius: 18,
                              child: IconButton(
                                iconSize: 17,
                                onPressed: () => totalProduct == 0  ? null : minTotalProduct(), 
                                icon:const Icon(FontAwesomeIcons.minus, color: Color(0xff667085),)),
                            ),
                            Text(totalProduct.toString(), style: const TextStyle(fontSize: 18, color: Colors.black),),
                            CircleAvatar(
                              backgroundColor: const Color(0xffB5C9AD),
                              radius: 18,
                              child: IconButton(
                                iconSize: 17,
                                onPressed: () => addTotalProduct(), 
                                icon:const Icon(FontAwesomeIcons.plus, color: Color(0xff667085),)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              const Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.solidStar, color: Color(0xffF5CA31), size: 24,),
                  SizedBox(width: 10,),
                  Text("4.9", style: TextStyle(color: Color(0xff101828), fontSize: 16),)
                ],
              ),
              const SizedBox(height: 20,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("About Plant", style: TextStyle(fontSize: 16, color: Color(0xff101828), fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Text("The String of Pearls is a geopolitical hypothesis proposed by United States political researchers in 2004. The term refers to the network of Chinese military and commercial facilities and relationships", style: TextStyle(fontSize: 14, color: Color(0xff98A2B3)), textAlign: TextAlign.justify,)
                ],
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff475E3E))
                    ),
                    onPressed: (){}, 
                    child: const Text("Buy Now!", style: TextStyle(fontSize: 18, color: Color(0xff181818)),)),
                )),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
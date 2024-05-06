import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toko_tanaman/screens/detail_product.dart';
import 'package:toko_tanaman/utils/collor_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedListCategory = 0;
  int lengData = 0;
  Future? future;

  List<String> listCategory = ["All", "Indoor", "Outdoor", "Hias", "Terapy", "Cactus"];

  @override
  void initState() {
   future = getData(0);
    super.initState();
  }

  Future<void> getData(int val) async {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        lengData = val == 0 ? 8 : val;
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: const Padding(
          padding:  EdgeInsets.only(left: 10),
          child:  CircleAvatar(
           radius: 48,
           backgroundImage: AssetImage("assets/images/profil.jpg"),
            ),
        ),
          centerTitle: false,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wellcome", style: TextStyle(color: Color(0xFF98A2B3), fontSize: 14),),
              Text("Catur Pamungkas", style: TextStyle(color: Color(0xFF344054), fontSize: 24), overflow: TextOverflow.fade,)
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                iconSize: 23,
                highlightColor: const Color(0xffD9D9D9),
                onPressed: (){}, 
                icon: const Icon(FontAwesomeIcons.bell), 
                color: const Color(0xff344054),),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(35), 
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(FontAwesomeIcons.locationDot, color: Color(0xffD0D5DD),),
                SizedBox(width: 5,),
                Text("Kebumen, Jawa Tengah", style: TextStyle(fontSize: 12, color: Color(0xffD0D5DD)),),
              ],
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF2F4F7),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass, color: smallText),
                      suffixIcon: Icon(FontAwesomeIcons.filter, color: smallText,),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        borderSide: BorderSide(color: Colors.red, width: 5),
                      ),
                      hintText: "Search here",
                      hintStyle: const TextStyle(fontSize: 14, color: Color(0xff98A2B3))
                    ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text("Category", style: TextStyle( fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCategory.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: index != 0 || index != listCategory.length - 1 ? 8 : 0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedListCategory = index;
                        switch (index) {
                          case 0:
                            future = getData(0);
                            break;
                          case 1:
                            future = getData(1);
                          break;
                          case 2:
                            future = getData(4);
                          break;
                          case 3:
                            future = getData(5);
                          break;
                          case 4:
                            future = getData(2);
                          break;
                          case 5:
                            future = getData(1);
                          break;
                          default:
                        }
                      });
                    }, 
                    style:  ButtonStyle(
                      side: const MaterialStatePropertyAll<BorderSide>(BorderSide(color: Color(0xffD0D5DD))),
                      backgroundColor: MaterialStatePropertyAll<Color>(selectedListCategory == index ? const Color(0xff475E3E) : Colors.white)),
                    child: Text(listCategory[index], style:  TextStyle(fontSize: 16, color: index == selectedListCategory ?const Color(0xffFCFCFD) : const Color(0xffD0D5DD)),)),
                );
              },),
            ),
           const  SizedBox(height: 20,),
            FutureBuilder(
              future: future, 
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }else if(snapshot.hasError){
                    return const Expanded(
                      child: Center(
                        child: Text("Something Wrong"),
                      ),
                    );
                }else{
                  return Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2, // jumlah row yang di jajajrkan
                mainAxisSpacing: 10, // jarak baris ke bawah
                crossAxisSpacing: 10, // jarak baris ke samaping
                itemCount: lengData,
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Definisikan border disini
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/tanaman-${index + 1}.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 8,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xffB5C9AD),
                        child: Center(
                          child: IconButton(
                            iconSize: 20,
                            onPressed: (){}, 
                            icon: const Icon(FontAwesomeIcons.solidHeart, color: Colors.white,)),
                        ),
                      )
                      ),
                      Positioned(
                        left: 150,
                        bottom: 20,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: const Color(0xffB5C9AD),
                        child: Center(
                          child: IconButton(
                            iconSize: 20,
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduct(index: index + 1,),)), 
                            icon: const Icon(FontAwesomeIcons.plus, color: Colors.white,)),
                        ),
                      )
                      ),
                    ],
                  );
                },
              ),
            )
            ;
                }
              },),
            ],
          ),
          )),
    );
  }
}
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:demo_project/UI/store_details_screen.dart';
import 'package:demo_project/Utils/utils.dart';
import 'package:demo_project/provider/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStores();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stores".toUpperCase()),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: gradient(),
        ),
        width: screenWidth(context),
        height: screenHeight(context),
        child: Consumer<StoreProvider>(builder: (context, val, _) {
          return ListView.builder(
              itemCount: val.businessesList.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, item) {
                debugPrint(val.businessesList[item].name);
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StoreDetails(details: val.businessesList[item])));
                  },
                  child: Container(
                    height: screenHeight(context) * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                              val.businessesList[item].imageUrl,
                            ),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high)),
                    margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: screenHeight(context) * 0.08,
                            width: screenWidth(context),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      val.businessesList[item].name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    val.businessesList[item].isClosed ?
                                    Text("Closed".toUpperCase(),style: const TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),):
                                    Text("Open".toUpperCase(),style: const TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold))

                                  ],
                                ),

                                AnimatedRatingStars(
                                  initialRating: val.businessesList[item].rating,
                                  minRating: 0.0,
                                  maxRating: 5.0,
                                  filledColor: Colors.amber,
                                  emptyColor: Colors.grey,
                                  filledIcon: Icons.star,
                                  halfFilledIcon: Icons.star_half,
                                  emptyIcon: Icons.star_border,
                                  onChanged: (double rating) {
                                    // Handle the rating change here
                                  },
                                  displayRatingValue: true,
                                  interactiveTooltips: true,
                                  customFilledIcon: Icons.star,
                                  customHalfFilledIcon: Icons.star_half,
                                  customEmptyIcon: Icons.star_border,
                                  starSize: 15.0,
                                  animationDuration: const Duration(milliseconds: 300),
                                  animationCurve: Curves.easeInOut,
                                  readOnly: false,
                                )
                              ],
                            ))),
                  ),
                );
              });
        }),
      )),
    );
  }

  void getStores() async {
    var pro = Provider.of<StoreProvider>(context, listen: false);
    await pro.storeData(context);
    setState(() {});
  }
}

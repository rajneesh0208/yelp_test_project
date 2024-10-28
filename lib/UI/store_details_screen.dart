import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:demo_project/Utils/constant.dart';
import 'package:demo_project/service/model.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';

class StoreDetails extends StatefulWidget {
  final Business details;

  const StoreDetails({super.key, required this.details});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.details.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: const BoxDecoration(color: Color(0xffEEF5FF)),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            storeImage(widget.details),
            storeDetails(widget.details),
            Expanded(child: storeTiming())
          ],
        ),
      )),
    );
  }

  Widget storeImage(Business details) {
    return SizedBox(
      // height: screenHeight(context) * 0.4,
      // width: screenWidth(context),

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
              width: screenWidth(context),
              child: Image.network(
                details.imageUrl,
                fit: BoxFit.cover,
              )),
          Positioned(
              bottom: 0.0,
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.25)),
                width: screenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          details.isClosed
                              ? Text(
                                  "Closed".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text("Open".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.greenAccent,
                                      fontWeight: FontWeight.bold)),
                          Text(
                            widget.details.price.toString(),
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          AnimatedRatingStars(
                            initialRating: details.rating,
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
                            animationDuration:
                                const Duration(milliseconds: 300),
                            animationCurve: Curves.easeInOut,
                            readOnly: false,
                          ),
                          Text(
                            "Review Count: ${details.reviewCount}",
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  storeDetails(Business details) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.05)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: screenWidth(context) * 0.7,
                child: Text(
                  details.location.displayAddress.join(', '),
                  style: const TextStyle(
                    color: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.category),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: screenWidth(context) * 0.7,
                child: Text(
                  category(details.categories),
                  style:
                      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.phone),
              const SizedBox(
                width: 15,
              ),
              Text(
                details.displayPhone,
                style:
                    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget storeTiming() {
    return Container(
      // height: screenHeight(context) * 0.40,
      decoration: const BoxDecoration(),
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15,bottom: 10),
      child: Flexible(
        child: ListView.builder(
            itemCount: widget.details.businessHours[0].open.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: screenWidth(context) * 0.1,
                        child: Text(
                          Constant.days[i],
                          style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "${widget.details.businessHours[0].open[i].start} - ${widget.details.businessHours[0].open[i].end}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

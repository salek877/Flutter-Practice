import 'dart:io';

import 'package:assignmenta/services/alert_dialogue.dart';
import 'package:assignmenta/services/exit_pop_services.dart';
import 'package:assignmenta/widgets/news_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List bannerImage = [
    {
      "image": "https://cdn.wallpapersafari.com/1/17/ZMBC10.jpg",
      "name": "Rahim",
      "age": "23",
      "nationality": "Bangladeshi",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
      "name": "Ramesh",
      "age": "22",
      "nationality": "Indian",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2017/02/08/17/24/fantasy-2049567__340.jpg",
      "name": "Alex",
      "age": "27",
      "nationality": "USA",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2017/02/08/17/24/fantasy-2049567__340.jpg",
      "name": "Alex",
      "age": "27",
      "nationality": "USA",
    },
    {
      "image": "https://cdn.wallpapersafari.com/1/17/ZMBC10.jpg",
      "name": "Rahim",
      "age": "23",
      "nationality": "Bangladeshi",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
      "name": "Ramesh",
      "age": "22",
      "nationality": "Indian",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2017/02/08/17/24/fantasy-2049567__340.jpg",
      "name": "Alex",
      "age": "27",
      "nationality": "USA",
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2017/02/08/17/24/fantasy-2049567__340.jpg",
      "name": "Alex",
      "age": "27",
      "nationality": "USA",
    },
  ];

  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  Future<bool> showExitPop() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert!"),
            content: Text("Do you want to exit?"),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (Platform.isIOS) {
                      exit(0);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                  child: Text("Yes")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: showExitPop,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: _height,
              width: _width,
              child: Column(
                children: [
                  Container(
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          height: 220.0,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            print("Page Changed $index");
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: bannerImage.map((banner) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: _width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(color: Colors.amber),
                                child: Card(
                                  elevation: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${banner["name"]}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(
                                                Icons.note_add,
                                                color: Colors.white,
                                                size: 32,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${banner["nationality"]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${banner["age"]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerImage.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            buttonCarouselController.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recent New",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: bannerImage.length,
                        shrinkWrap: true,
                        itemBuilder: (buildContext, index) {
                          var bannerDetails = bannerImage[index];
                          return NewsCardWidget(
                            imageUrl:
                                "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg",
                            title: "${bannerDetails["name"]}",
                            subtitle: "${bannerDetails["nationality"]}",
                            icon: Icons.bookmark,
                            iconColor: Colors.amber,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

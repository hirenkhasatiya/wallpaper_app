import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/wallpaper_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<wallPaperController>(context, listen: false)
                  .searchbar();
            },
            icon: Icon(Provider.of<wallPaperController>(context).search == true
                ? Icons.search_off
                : Icons.search),
          )
        ],
        title: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "WallPaper",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xffC70039)),
            ),
            TextSpan(
                text: " app",
                style: TextStyle(fontSize: 15, color: Color(0xff141E46)))
          ]),
        ),
        centerTitle: true,
      ),
      body: Consumer<wallPaperController>(builder: (context, Provider, child) {
        return StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == ConnectivityResult.none) {
                return const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      "Check Your Internet",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff141E46)),
                    ),
                    Spacer(),
                    CircularProgressIndicator(
                      color: Color(0xffC70039),
                    ),
                    Spacer(),
                  ],
                ));
              } else {
                return Column(
                  children: [
                    Visibility(
                      visible: Provider.search == true,
                      child: Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onSubmitted: (val) {
                            Provider.getwallPaper(query: val);
                          },
                          cursorColor: Color(0xffC70039),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            label: Text("Search Wallpaper"),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: Provider.allwallpapers.length,
                      options: CarouselOptions(
                          initialPage: 1,
                          autoPlay: true,
                          pageSnapping: true,
                          enableInfiniteScroll: true,
                          animateToClosest: true,
                          enlargeCenterPage: true),
                      itemBuilder: (BuildContext context, index, realIndex) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("Detail_Page",
                                arguments: Provider.allwallpapers[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      Provider
                                          .allwallpapers[index].largeImageUrl,
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 6,
                                      spreadRadius: 3,
                                      offset: Offset(3, 2)),
                                ]),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: StaggeredGrid.count(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          children: List.generate(
                            Provider.allwallpaper.length,
                            (index) => StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: index % 2 == 0 ? 0.9 : 1.3,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed("Detail_Page",
                                      arguments: Provider.allwallpaper[index]);
                                },
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      child: Image.network(
                                        Provider
                                            .allwallpaper[index].largeImageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.comment,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                    "${Provider.allwallpaper[index].comments}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.heart,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                    "${Provider.allwallpaper[index].likes}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const Text("");
            }
          },
        );
      }),
    );
  }
}

import 'dart:ui';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/wallpaper_controller.dart';
import 'package:wallpaper_app/modal/wallpaper_modal.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Wallpaper wallpaper =
        ModalRoute.of(context)!.settings.arguments as Wallpaper;

    return Consumer<wallPaperController>(builder: (context, Provider, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Provider.hartbar();
              },
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: Provider.hart == true ? Colors.red : Colors.black,
              ),
            )
          ],
          title: const Text(
            "WallPaper Details",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffC70039)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: NetworkImage(
                            wallpaper.largeImageUrl,
                          ),
                          fit: BoxFit.cover)),
                  height: 530,
                  width: 250,
                  child: Transform.scale(
                      scale: 1.3,
                      child: Image.asset("assets/image/im.png",
                          fit: BoxFit.cover)),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.comment,
                        size: 35,
                        color: Color(0xff141E46),
                      ),
                      Text("${wallpaper.comments}"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        CupertinoIcons.heart_fill,
                        size: 35,
                        color: Color(0xff141E46),
                      ),
                      Text("${wallpaper.likes}"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.download,
                        size: 35,
                        color: Color(0xff141E46),
                      ),
                      Text("${wallpaper.downloads}"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 35,
                        color: Color(0xff141E46),
                      ),
                      Text("${wallpaper.views}"),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Color(0xff141E46),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Provider.setWallpaper(link: wallpaper.largeImageUrl);
                    },
                    child: Icon(Icons.done),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xff141E46),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 180,
                          width: double.infinity,
                          child: Column(
                            children: [
                              RadioListTile(
                                title: const Text("Home Screen"),
                                activeColor: Color(0xff141E46),
                                value: AsyncWallpaper.HOME_SCREEN,
                                onChanged: (val) {
                                  Provider.platformchange(
                                    platform: val!,
                                  );
                                },
                                groupValue: Provider.platform,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              RadioListTile(
                                title: const Text("Lock Screen"),
                                activeColor: Color(0xff141E46),
                                value: AsyncWallpaper.LOCK_SCREEN,
                                onChanged: (val) {
                                  Provider.platformchange(platform: val!);
                                },
                                groupValue: Provider.platform,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              RadioListTile(
                                title: const Text("Both Screen"),
                                activeColor: Color(0xff141E46),
                                value: AsyncWallpaper.BOTH_SCREENS,
                                onChanged: (val) {
                                  Provider.platformchange(platform: val!);
                                },
                                groupValue: Provider.platform,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.wallpaper),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }
}

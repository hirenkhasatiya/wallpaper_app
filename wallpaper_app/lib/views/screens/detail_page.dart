import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top: 25),
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
            ],
          ),
        ),
      );
    });
  }
}

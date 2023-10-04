import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/apihelper.dart';
import 'package:wallpaper_app/modal/wallpaper_modal.dart';

class wallPaperController extends ChangeNotifier {
  List<Wallpaper> allwallpaper = [];
  List<Wallpaper> allwallpapers = [];

  bool search = false;

  searchbar() {
    search = !search;
    notifyListeners();
  }

  bool hart = false;

  hartbar() {
    hart = !hart;
    notifyListeners();
  }

  wallPaperController() {
    getwallPaper();
  }

  getwallPaper({String query = "lion"}) async {
    allwallpaper = await ApiHelper.apiHelper.getWallpaper(query: query) ?? [];
    allwallpapers =
        (await ApiHelper.apiHelper.getWallpaper(query: "green forest"))!;
    notifyListeners();
  }
}

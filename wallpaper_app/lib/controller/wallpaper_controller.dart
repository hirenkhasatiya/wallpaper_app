import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/apihelper.dart';
import 'package:wallpaper_app/modal/wallpaper_modal.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

class wallPaperController extends ChangeNotifier {
  List<Wallpaper> allwallpaper = [];
  List<Wallpaper> allwallpapers = [];

  bool search = false;

  int platform = AsyncWallpaper.HOME_SCREEN;

  searchbar() {
    search = !search;
    notifyListeners();
  }

  bool hart = false;

  hartbar() {
    hart = !hart;
    notifyListeners();
  }

  platformchange({required int platform}) {
    this.platform = platform;
    notifyListeners();
  }

  wallPaperController() {
    getwallPaper();
  }

  getwallPaper({String query = "lion"}) async {
    allwallpaper = await ApiHelper.apiHelper.getWallpaper(query: query) ?? [];
    allwallpapers =
        await ApiHelper.apiHelper.getWallpaper(query: "green forest") ?? [];
    notifyListeners();
  }

  setWallpaper({required String link}) async {
    await AsyncWallpaper.setWallpaper(
      url: link,
      wallpaperLocation: platform,
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(),
    );
  }
}

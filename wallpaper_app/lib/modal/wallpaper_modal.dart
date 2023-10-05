class Wallpaper {
  String previewUrl;
  String webformatUrl;
  String largeImageUrl;
  int likes;
  int comments;
  String userImageUrl;
  int downloads;
  int views;

  Wallpaper({
    required this.previewUrl,
    required this.webformatUrl,
    required this.largeImageUrl,
    required this.likes,
    required this.comments,
    required this.userImageUrl,
    required this.downloads,
    required this.views,
  });

  factory Wallpaper.fromJson({required Map<String, dynamic> data}) => Wallpaper(
        previewUrl: data["previewURL"],
        webformatUrl: data["webformatURL"],
        largeImageUrl: data["largeImageURL"],
        likes: data["likes"],
        comments: data["comments"],
        userImageUrl: data["userImageURL"],
        downloads: data["downloads"],
        views: data["views"],
      );
}

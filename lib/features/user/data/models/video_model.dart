class VideoModel {
  String? mediaUrl;
  String? imageVideo;
  String? videoName;
  bool? isAvailable;
  bool? isWatched;

  VideoModel({
    this.mediaUrl,
    this.imageVideo,
    this.videoName,
    this.isAvailable,
    this.isWatched,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    mediaUrl = json['mediaUrl'];
    imageVideo = json['imageVideo'];
    videoName = json['videoName'];
    isWatched = json['isWatched'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mediaUrl'] = mediaUrl;
    data['imageVideo'] = imageVideo;
    data['videoName'] = videoName;
    data['isAvailable'] = isAvailable;
    data['isWatched'] = isWatched;
    return data;
  }
}

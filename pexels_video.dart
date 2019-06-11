import "pexels_sources.dart";

class Video {
  final int id;
  final int width;
  final int height;
  final String url;
  final String image;
  final String fullRes;
  final int duration;
  final Map<String, VideoSource> sources;
  const Video(this.id, this.width, this.height, this.url, this.image,
      this.fullRes, this.duration, this.sources);

  /// [id] : the id of the video.
  String get(String id) {
    return sources[id].Link;
  }
}

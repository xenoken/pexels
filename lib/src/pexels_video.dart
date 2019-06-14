import 'pexels_sources.dart';

class Video {
  final int id;
  final int width;
  final int height;
  final String url;
  final String image;
  final String fullRes;
  final int duration;
  final List<VideoSource> sources;
  const Video(this.id, this.width, this.height, this.url, this.image,
      this.fullRes, this.duration, this.sources);

  /// [index] : the index of the video file.
  String get(int index) => sources[index].link;
}


abstract class Source {
  final String Link;
  const Source(this.Link);
}

class PhotoSource extends Source {
  const PhotoSource(String link) : super(link);
}

class VideoSource extends Source {
  final int id;
  final int width;
  final int height;
  final String quality;
  final String fileType;
  const VideoSource(this.id, this.width, this.height, this.quality, this.fileType,
      String link)
      : super(link);
}

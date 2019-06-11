import "pexels_sources.dart";
import "pexels_image_formats.dart";

class Photo {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerURL;
  final Map<String, PhotoSource> sources;
  const Photo(this.id, this.width, this.height, this.url, this.photographer,
      this.photographerURL, this.sources);
  // const _Photo.fromJson(dynamic data):
  //   id = data['id'];
  //   width = data['width'];
  //   height = data['height'];
  //   url = data['url'];
  //   photographer = data['photographer'];
  //   photographerURL = data['photographerURL'];
  //   sources = _getSources();
  //   {
  // }
  String get({ImageFormats format = ImageFormats.original}) {
    return sources[format.toString().replaceAll("ImageFormats.","")].Link;
  }
}
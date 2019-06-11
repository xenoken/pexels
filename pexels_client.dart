import "dart:convert";
import "dart:io";

import "pexels_collection.dart";
import "pexels_endpoints.dart";
import "pexels_image_formats.dart";
import "pexels_photo.dart";
import "pexels_search_result.dart";
import "pexels_sources.dart";
import "pexels_quota.dart";
import "pexels_video.dart";

class PexelsClient {
  static Quota _quota = Quota();
  final String APIKey;

  PexelsClient(this.APIKey);

  Future<String> _getData(String url) async {
    HttpClient client = new HttpClient();
    var req = await client.getUrl(Uri.parse(url));
    req.headers.add("Authorization", APIKey);
    var resp = await req.close();
    var data =
        await resp.transform(utf8.decoder).transform(LineSplitter()).single;
    return data;
  }

  Future<Quota> getQuota() async {
    return _quota;
  }

  Future<Photo> getPhoto({int id = null}) async {
    // if id is null, then returns a random photo.

    var url = (id == null)
        ? Endpoints.photoRandom() // page: random value in [1,1000] range.
        : Endpoints.photo(id);

    String data = await _getData(url);

    var o = jsonDecode(data);

    o = o['photos'][0];
    // extract data
    var src = o['src'];
    var sources = <String, PhotoSource>{};
     ImageFormats.values.forEach((size){
        var format = size.toString().replaceAll("ImageFormats.", "");
        sources[format] = PhotoSource(src[format]);
    });
    return Photo(o['id'], o['width'], o['height'], o['url'], o['photographer'],
        o['photographer_url'], sources);
  }

  Future<Video> getVideo(String id) {}

  Future<SearchResult<Photo>> searchPhotos(String query,
      {Collection collection = Collection.Regular,
      int resultsPerPage = 15,
      int page = 1}) async {
    var url = "";
    switch (collection) {

      case Collection.Regular:
        url = Endpoints.photoSearch(query, page: page, perPage: resultsPerPage);
        break;
      case Collection.Curated:
        url = Endpoints.photoSearchCurated(page: page, perPage: resultsPerPage);
        break;
      case Collection.Popular:
        url = Endpoints.photoSearchPopular(page: page, perPage: resultsPerPage);
        break;
    }

    String data = await _getData(url);

    var resultData = jsonDecode(data);

    var photosData = resultData['photos'];

    var photos = List<Photo>();

    for (dynamic ph in photosData) {
      // extract data
      var src = ph['src'];

      var sources = <String, PhotoSource>{};

    ImageFormats.values.forEach((size){
        var format = size.toString().replaceAll("ImageFormats.", "");
        sources[format] = PhotoSource(src[format]);
    });

      var photo = Photo(ph['id'], ph['width'], ph['height'], ph['url'],
          ph['photographer'], ph['photographer_url'], sources);

      photos.add(photo);
    }

    return new SearchResult(resultData['page'], resultData['per_page'],
        resultData['total_results'], resultData['next_page'], photos);
  }

  Future<SearchResult<Video>> searchVideos(String query,
      {Collection collection = Collection.Regular,
      int resultsPerPage = 15,
      int page = 1,
      int minWidth = null,
      int maxWidth = null,
      int minDuration = null,
      int maxDuration = null}) async {

      }
}

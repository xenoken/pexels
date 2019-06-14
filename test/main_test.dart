import 'package:pexels/src/pexels_collection.dart';
import 'package:test/test.dart';
import 'package:pexels/pexels.dart';

import 'api_key.dart';

void main() {
  group('Pexels-Tests-Video', () {
    test('getVideoWithInvalidID_returnsnull', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.getVideo(id: 1234);
      //assert
      expect(p, null);
    });

    test('getVideoWithValidID_returnsVideo', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.getVideo(
          id: 857251);
      //assert
      expect(p == null, false);
    });

    test('searchVideoRegular_returnsSearchResult', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.searchVideos('test', collection: Collection.Regular);
      //assert
      expect(p == null, false);
    });

    test('searchVideoPopular_returnsSearchResult', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.searchVideos('test', collection: Collection.Popular);
      //assert
      expect(p == null, false);
    });

    test('searchVideoCurated_returnsSearchResult', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.searchVideos('test', collection: Collection.Curated);
      //assert
      expect(p == null, false);
    });
  });

  group('Pexels-Tests-Photo', () {
    test('getPhotoWithValidID_returnsPhoto', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.getPhoto(
          id: 1366919);
      //assert
      expect(p == null, false);
    });

    test('getPhotoWithInvalidID_returnsnull', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.getPhoto(id: -1);
      //assert
      expect(p, null);
    });

    test('searchPhotosRegular_returnsSearchResult', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.searchPhotos('test', collection: Collection.Regular);
      //assert
      expect(p == null, false);
    });

    test('searchPhotosPopular_returnsSearchResult', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.searchPhotos('test', collection: Collection.Popular);
      //assert
      expect(p == null, false);
    });

    test('searchPhotosCurated_returnsSearchResult', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.searchPhotos('test', collection: Collection.Curated);

      var photoLink = p[0].get(ImageFormats.landscape);
      //assert
      expect(p != null && photoLink != null, true);
    });
  });

  group('Pexels-Tests-Quota', () {
    test('getQuota_returnsQuota', () async {
      //arrange
      var client = PexelsClient(APIKey.value);
      //act
      var p = await client.getQuota();
      //assert
      expect(p != null, true);
    });
  });
}

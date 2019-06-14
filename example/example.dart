import "dart:io";
import "../lib/pexels.dart";

void main() async {

  var client = new PexelsClient('key');

  var p = await client.getPhoto(); // get a random video.
  var link = p.get(ImageFormats.small);
  stdout.write(link);

  var vid = await client.getVideo(id:857251);
  stdout.write(vid.sources[0].link);

  var result = await client.searchPhotos("tree");
  var photo = result[0];
  stdout.write(photo.sources['original'].link);

  var result2 = await client.searchVideos("balloon");
  var video = result2[0];
  stdout.write(video.sources[0].link);

  var quota = await client.getQuota();
  stdout.write(quota);
  
}

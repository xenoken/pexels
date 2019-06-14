enum ImageFormats {
  /// The size of the original image
  /// is given with the attributes width and height.
  original,

  /// This image has a maximum width of 940px and a maximum height of 650px.
  /// It has the aspect ratio of the original image.
  large,

  /// This image has a maximum width of 1880px and a maximum height of 1300px.
  /// It has the aspect ratio of the original image.
  large2x,

  /// This image has a height of 350px and a flexible width.
  /// It has the aspect ratio of the original image.
  medium,

  /// This image has a height of 130px and a flexible width.
  /// It has the aspect ratio of the original image.
  small,

  /// This image has a width of 800px and a height of 1200px.
  portrait,

  /// This image has a width of 1200px and height of 627px.
  landscape,

  /// This image has a width of 280px and height of 200px.
  tiny,
}

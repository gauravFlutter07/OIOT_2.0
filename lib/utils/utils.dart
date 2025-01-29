
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:oiot/main.dart';

import '../imports.dart';

class Utils{

  Map<String, dynamic> getDecodedToken(){
    var token = localStorageService.token;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken;
  }

  static showImg(String url, double height, double width) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

}
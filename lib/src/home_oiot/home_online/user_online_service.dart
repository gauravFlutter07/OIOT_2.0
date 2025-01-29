import 'dart:developer';

import '../../../imports.dart';

class UserOnlineService {
  List<Map<String, dynamic>> onlineHomeScreen = [
    {
      "serviceType": "Daily Ride",
      "servicePic":
          "https://media.istockphoto.com/id/490313551/photo/white-3d-car-luxury-suv.jpg?s=612x612&w=0&k=20&c=nQI_40FSgNGzpq8r59uSrshMfePNuFbEA59lcxOiiY4=",
      "isActive": true,
    },
    {
      "serviceType": "Outstation Ride",
      "servicePic":
          "https://images.91wheels.com/news/wp-content/uploads/2020/10/download-2.png?width=360&&q=70",
      "isActive": true,
    },
    {
      "serviceType": "Rental Ride",
      "servicePic":
          "https://media.istockphoto.com/id/1157655660/photo/generic-red-suv-on-a-white-background-side-view.jpg?s=612x612&w=0&k=20&c=ecrvXZhimUHnYES-kx7L5b-TDtRU5kAFPpNm0ZtAp1Y=",
      "isActive": true,
    },
  ];

  List<Map<String, dynamic>> carouselImages = [
    {
      "imageUrl":
          "https://i.pinimg.com/736x/2d/0e/3e/2d0e3ed5014d0f464b4fe5d1cd98f1e0.jpg"
    },
    {
      "imageUrl":
          "https://miro.medium.com/v2/resize:fit:1200/1*k2UCHU66WQ0YWtWMwT_vzg.jpeg"
    },
    {
      "imageUrl":
          "https://media.licdn.com/dms/image/D4D12AQEMp_KGw4NTGg/article-cover_image-shrink_720_1280/0/1696745137326?e=2147483647&v=beta&t=ECy8xmedRqU5geXsV6Uxx5zI6_iD5HKaHfsZdaP4U6E"
    },
  ];

  Dio dio = Dio();

  Future<List<HomeScreenServiceModel>?> fetchOnlineHomeData() async {
    try {
      // Simulating API call
      int statusCode = 200;
      if (statusCode == 200) {
        List<HomeScreenServiceModel> onlineHomeDataList = onlineHomeScreen
            .map((onlineHome) => HomeScreenServiceModel.fromJson(onlineHome))
            .toList();
        return onlineHomeDataList;
      } else {
        throw Exception('Failed to fetch online home data');
      }
    } catch (e) {
      log('Error fetching online home data: $e');
      return [];
    }
  }

  Future<List<CarouselImageModel>?> fetchCarouselImages() async {
    try {
      // Simulating API call
      int statusCode = 200;
      if (statusCode == 200) {
        List<CarouselImageModel> carouselImageList = carouselImages
            .map((image) => CarouselImageModel.fromJson(image))
            .toList();
        return carouselImageList;
      } else {
        throw Exception('Failed to fetch carousel images');
      }
    } catch (e) {
      log('Error fetching carousel images: $e');
      return [];
    }
  }
}


import 'package:careergati/service/HomeRes.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "https://managedlandlord.com/newManage/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("listing")
  Future<HomeRes> fetchPropertyListing();



}
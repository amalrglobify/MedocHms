import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  @POST('Master/DepartmentGetandGets')
  Future<dynamic> getDepartments(@Body() Map<String, dynamic> body);

  @POST('Login/UserLoginCheck?')
  Future<dynamic> userLoginCheck(@Body() Map<String, dynamic> body);

  @POST('Master/ItemGetAll?dummy=1')
  Future<dynamic> getAllRevisitEntriesList(@Body() Map<String, dynamic> body);

}

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

  @POST('Revisit/HMS_DashBoardWidgets?FromDate=01/01/2024&ToDate=01/01/2024&ToDay=01/01/2024&')
  Future<dynamic> getAllDashboardWidgetDetails(@Body() Map<String, dynamic> body);

  @POST('Master/HMS_DashboardDoctorGets?DoctorsId=1&')
  Future<dynamic> getAvailableDoctors(@Body() Map<String, dynamic> body);

  @POST('Revisit/HMS_DB_RegRevisitGraph?Fromdate=01/01/2024&Todate=01/10/2024&DeptId=1&Flag=1')
  Future<dynamic> getRevisitGraphDetails(@Body() Map<String, dynamic> body);

}

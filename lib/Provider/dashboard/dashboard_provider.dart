
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medochms/models/dashboard/collection_report_model.dart';
import 'package:medochms/rest/hive_repo.dart';
import 'package:http/http.dart' as http;
import '../../models/dashboard/dashboard_details_model.dart';
import '../../models/doctors/departments_overview.dart';
import '../../rest/rest_client_provider.dart';

final dashboardProvider = ChangeNotifierProvider<DashboardProvider>(
      (ref) => DashboardProvider(ref),
);

class DashboardProvider extends ChangeNotifier {
  DashboardProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getDashboardDetails();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<DashboardDetails> _dashboardDetails = [];
  List<DashboardDetailsList> _dashboardDetailsList = [];

  List<DashboardDetailsList> get listState => _dashboardDetailsList;

  Future<List<DashboardDetailsList>> getDashboardDetails() async {
    final map = <String, dynamic>{};
    map.putIfAbsent("DeptId", () => HiveRepo.instance.getDepartmentId());
    map.putIfAbsent("UserId", () => HiveRepo.instance.user!.oList![0].userId.toString());


    try {
      final response = await _restClient.getAllDashboardWidgetDetails(map);

      final dashboardDetails = DashboardDetails.fromJson(response);

      _dashboardDetailsList = dashboardDetails.dashboardDetailsList ?? [];

      notifyListeners();

      return _dashboardDetailsList;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();

      return [];
    }
  }

  List<DepartmentsOverviewList> _departmentsOverviewModelList = [];

  List<DepartmentsOverviewList> get departmentsOverviewModelListState => _departmentsOverviewModelList;

  Future<List<DepartmentsOverviewList>> getDepartmentsOverviewList() async {
    final map = <String, dynamic>{};
    map.putIfAbsent("Fromdate", () => "01/01/2024");
    map.putIfAbsent("Todate", () => "01/11/2024");
    map.putIfAbsent("DeptId", () => HiveRepo.instance.getDepartmentId());
    map.putIfAbsent("Flag", () => "1");

    try {
      final response = await _restClient.getDepartmentsOverViewList(map);

      final departmentsOverviewModelList = DepartmentsOverviewModel.fromJson(response);

      _departmentsOverviewModelList = departmentsOverviewModelList.departmentsOverviewList ?? [];

      notifyListeners();

      return _departmentsOverviewModelList;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();

      return [];
    }
  }

  List<CollectionReportModel> collectionReportList = [];
  List<CollectionReportModel> collectionList = [];

  Future<List<CollectionReportModel>> getAllCollectionReportDetails(String fromDate, String toDate) async {
    String baseUrl = HiveRepo.instance.getBaseUrl().toString();
    final String apiUrl = "${baseUrl}Master/ProcedureBillReportItemWise?FromDate=$fromDate&ToDate=$toDate&Doctor=0";

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<CollectionReportModel> collectionReportModel = jsonList
            .map((jsonItem) => CollectionReportModel.fromJson(jsonItem))
            .toList();

        collectionReportList = collectionReportModel;

        notifyListeners();

        return collectionReportModel;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

}

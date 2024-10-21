
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medochms/models/revisit/revisit_graph_model.dart';
import 'package:medochms/rest/hive_repo.dart';

import 'package:http/http.dart' as http;
import '../../models/revisit/revisit_list_model.dart';
import '../../models/revisit/revisit_report_model.dart';
import '../../rest/rest_client_provider.dart';

final revisitListProvider = ChangeNotifierProvider<RevisitListProvider>(
      (ref) => RevisitListProvider(ref),
);

class RevisitListProvider extends ChangeNotifier {
  RevisitListProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getAllRevisitEntriesList();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<RevisitListingModel> _revisitList = [];

  Future<List<RevisitListingModel>> getAllRevisitEntriesList() async {
    notifyListeners();
    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(now);
    final map = <String, dynamic>{};
    map.putIfAbsent("FromDate", () => "01/01/2024");
    map.putIfAbsent("Todate", () => "01/01/2024");
    map.putIfAbsent("DoctorId", () => "0");
    map.putIfAbsent("Flag", () => "1");
    map.putIfAbsent("RevisitId", () => "0");
    map.putIfAbsent("OPNumber", () => "0");
    map.putIfAbsent("DeptId", () => HiveRepo.instance.getDepartmentId());

    try {
      final response = await _restClient.getRevisitList(map);

      final List<dynamic> jsonList = response;

      final List<RevisitListingModel> revisitListingModel = jsonList
          .map((jsonItem) => RevisitListingModel.fromJson(jsonItem))
          .toList();

      _revisitList = revisitListingModel;

      notifyListeners();

      return revisitListingModel;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

  List<RevisitGraphDetails> revisitGraphDetails = [];
  List<RevisitGraphDetailsList> _revisitGraphDetailsList = [];

  List<RevisitGraphDetailsList> get listState => _revisitGraphDetailsList;

  Future<List<RevisitGraphDetailsList>> getRevisitGraphDetails() async {
    final map = <String, dynamic>{};
    map.putIfAbsent("DeptId", () => HiveRepo.instance.getDepartmentId());
    try {
      final response = await _restClient.getRevisitGraphDetails(map);

      final revisitGraphDetails = RevisitGraphDetails.fromJson(response);

      _revisitGraphDetailsList = revisitGraphDetails.revisitGraphDetailsList ?? [];

      notifyListeners();

      return _revisitGraphDetailsList;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();

      return [];
    }
  }

  List<RevisitReportModel> revisitReportList = [];
  List<RevisitReportModel> revisitList = [];

  Future<List<RevisitReportModel>> getAllRevisitReportDetails(String fromDate, String toDate) async {
    String baseUrl = HiveRepo.instance.getBaseUrl().toString();
    final String apiUrl = "${baseUrl}Master/RevisitReport?FromDate=$fromDate%23%231&ToDate=$toDate&Doctor=0&Revisit_Id=0";

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<RevisitReportModel> revisitReportModel = jsonList
            .map((jsonItem) => RevisitReportModel.fromJson(jsonItem))
            .toList();

        revisitReportList = revisitReportModel;

        notifyListeners();

        return revisitReportModel;
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

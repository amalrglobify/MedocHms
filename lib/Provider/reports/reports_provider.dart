
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:medochms/models/reports/lab_bill_report_model.dart';
import '../../models/reports/procedure_bill_report_model.dart';
import '../../rest/hive_repo.dart';
import '../../rest/rest_client_provider.dart';

final reportsProvider = ChangeNotifierProvider<ReportsProvider>(
      (ref) => ReportsProvider(ref),
);

class ReportsProvider extends ChangeNotifier {
  ReportsProvider(this._ref) : _restClient = _ref.read(restClientProvider);
  final Ref _ref;
  final RestClient _restClient;



  List<ProcedureBillReportModel> procedureBillReportList = [];

  Future<List<ProcedureBillReportModel>> getAllProcedureBillReportDetails(String fromDate, String toDate) async {
    String baseUrl = HiveRepo.instance.getBaseUrl().toString();
    final String apiUrl = "${baseUrl}Master/ProcedureBillReport?FromDate=$fromDate%23%230&ToDate=$toDate&Doctor=0&UserId=0";

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<ProcedureBillReportModel> procedureBillReportModel = jsonList
            .map((jsonItem) => ProcedureBillReportModel.fromJson(jsonItem))
            .toList();

        procedureBillReportList = procedureBillReportModel;

        notifyListeners();

        return procedureBillReportModel;
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


  List<LabBillReportModel> labBillReportList = [];

  Future<List<LabBillReportModel>> getAllLabBillReportDetails(String fromDate, String toDate) async {
    String baseUrl = HiveRepo.instance.getBaseUrl().toString();
    final String apiUrl = "${baseUrl}Master/LabBillReport?FromDate=$fromDate%23%230&ToDate=$toDate&Doctor=0&UserId=0";

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<LabBillReportModel> labBillReportModel = jsonList
            .map((jsonItem) => LabBillReportModel.fromJson(jsonItem))
            .toList();

        labBillReportList = labBillReportModel;

        notifyListeners();

        return labBillReportModel;
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

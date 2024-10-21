
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medochms/models/registration/registration_List_Model.dart';
import 'package:medochms/models/registration/registration_report_model.dart';
import 'package:http/http.dart' as http;
import '../../rest/hive_repo.dart';
import '../../rest/rest_client_provider.dart';

final registrationProvider = ChangeNotifierProvider<RegistrationReportProvider>(
      (ref) => RegistrationReportProvider(ref),
);

class RegistrationReportProvider extends ChangeNotifier {
  RegistrationReportProvider(this._ref) : _restClient = _ref.read(restClientProvider);
  final Ref _ref;
  final RestClient _restClient;



  List<RegistrationReportModel> registrationReportList = [];
  List<RegistrationListModel> registrationList = [];

  Future<List<RegistrationReportModel>> getAllRegistrationReportDetails(String fromDate, String toDate) async {
    String baseUrl = HiveRepo.instance.getBaseUrl().toString();
    final String apiUrl = "${baseUrl}Master/RegistrationReport?FromDate=$fromDate%23%231&ToDate=$toDate&Doctor=0&RegId=0";

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<RegistrationReportModel> registrationReportModel = jsonList
            .map((jsonItem) => RegistrationReportModel.fromJson(jsonItem))
            .toList();

        registrationReportList = registrationReportModel;

        notifyListeners();

        return registrationReportModel;
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

  Future<List<RegistrationListModel>> getAllRegistrationList() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getRegistrationList(map);
        final List<dynamic> jsonList = response;

        final List<RegistrationListModel> registrationListModel = jsonList
            .map((jsonItem) => RegistrationListModel.fromJson(jsonItem))
            .toList();

        registrationList = registrationListModel;

        notifyListeners();

        return registrationListModel;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

}


import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medochms/models/ip/ip_listing_model.dart';
import '../../rest/rest_client_provider.dart';

final ipListProvider = ChangeNotifierProvider<IpListProvider>(
      (ref) => IpListProvider(ref),
);

class IpListProvider extends ChangeNotifier {
  IpListProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getAllIpListPatients();
  }
  final Ref _ref;
  final RestClient _restClient;

  List<IPListingModel> ipList = [];

  Future<List<IPListingModel>> getAllIpListPatients() async {

    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(now);
    final map = <String, dynamic>{};
    map.putIfAbsent("FromDate", () => "10/10/2023");
    map.putIfAbsent("ToDate", () => formattedDate.toString());
    map.putIfAbsent("DoctorId", () => "0");
    map.putIfAbsent("PatientId", () => "0");
    map.putIfAbsent("DeptId", () => "1");
    map.putIfAbsent("UserId", () => "1");
    map.putIfAbsent("Flag", () => "0");
    try {
      final response = await _restClient.getIPPatientsList(map);

      final List<dynamic> jsonList = response;

        final List<IPListingModel> ipListingModelModel = jsonList
            .map((jsonItem) => IPListingModel.fromJson(jsonItem))
            .toList();

      ipList = ipListingModelModel;

        notifyListeners();

        return ipListingModelModel;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

}

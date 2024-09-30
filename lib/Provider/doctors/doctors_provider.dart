
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medochms/rest/hive_repo.dart';

import '../../models/dashboard/dashboard_details_model.dart';
import '../../models/departments/departments_model.dart';
import '../../models/doctors/doctors_available.dart';
import '../../models/revisit/revisit_list_model.dart';
import '../../rest/rest_client_provider.dart';

final doctorsProvider = ChangeNotifierProvider<DoctorsProvider>(
      (ref) => DoctorsProvider(ref),
);

class DoctorsProvider extends ChangeNotifier {
  DoctorsProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getAvailableDoctors();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<DoctorsAvailable> _doctorsAvailable = [];
  List<DoctorsAvailableList> _doctorsAvailableList = [];

  List<DoctorsAvailableList> get listState => _doctorsAvailableList;

  Future<List<DoctorsAvailableList>> getAvailableDoctors() async {
    final map = <String, dynamic>{};
    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(now);
    map.putIfAbsent("CurrentDate", () => formattedDate);
    try {
      final response = await _restClient.getAvailableDoctors(map);

      final dashboardDetails = DoctorsAvailable.fromJson(response);

      _doctorsAvailableList = dashboardDetails.doctorsAvailableList ?? [];

      notifyListeners();

      return _doctorsAvailableList;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();

      return [];
    }
  }

}

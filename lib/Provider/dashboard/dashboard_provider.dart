
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medochms/rest/hive_repo.dart';

import '../../models/dashboard/dashboard_details_model.dart';
import '../../models/departments/departments_model.dart';
import '../../models/revisit/revisit_list_model.dart';
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

}

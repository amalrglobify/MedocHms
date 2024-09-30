
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medochms/models/revisit/revisit_graph_model.dart';
import 'package:medochms/rest/hive_repo.dart';

import '../../models/departments/departments_model.dart';
import '../../models/revisit/revisit_list_model.dart';
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



  List<AllProducts> _products = [];

  Future<List<AllProducts>> getAllRevisitEntriesList() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getAllRevisitEntriesList(map);

      // Assuming response is a List<dynamic> from JSON
      final List<dynamic> jsonList = response;

      // Parse the JSON into a list of AllProducts
      final List<AllProducts> products = jsonList
          .map((jsonItem) => AllProducts.fromJson(jsonItem))
          .toList();

      // Update the state with the list of products
      _products = products;

      notifyListeners();

      return products;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return []; // Return an empty list in case of an error
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

}

import 'package:NewsApp/models/news_response.dart';
import 'package:NewsApp/services/api_service.dart';
import 'package:NewsApp/widgets/tools/base_view_models.dart';

import 'package:flutter/material.dart';

class DashBoardViewModel extends BaseViewModel {
  DashBoardViewModel({required ApiService apiService})
      : _apiService = apiService;

  final ApiService _apiService;
  List<Articles> articles = [];

  Future<void> dashBoard() async {
    articles = await runBusyFuture(
      _apiService.handleDashBoard(),
    );
  }
}

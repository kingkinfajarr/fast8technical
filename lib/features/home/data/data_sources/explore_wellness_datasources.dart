import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/explore_wellness_model.dart';

abstract class ExploreWellnessDataSource {
  Future<List<ExploreWellnessModel>> fetchExploreData();
}

class ExploreWellnessDataSourceImpl implements ExploreWellnessDataSource {
  @override
  Future<List<ExploreWellnessModel>> fetchExploreData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/explore-wellness.json');
      final Map<String, dynamic> jsonResponse = json.decode(response);

      final List<dynamic> data = jsonResponse['data'];

      return data.map((item) => ExploreWellnessModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}

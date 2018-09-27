import 'dart:convert';
import 'dart:io';

import 'generated/route_guide.pb.dart';

const coordFactor = 1e7;

final List<Feature> featuresDb = _readDatabase();

List<Feature> _readDatabase() {
  final dbData = new File('data/route_guide_db.json').readAsStringSync();
  final List db = jsonDecode(dbData);
  return db.map((entry) {
    final location = new Point()
      ..latitude = entry['location']['latitude']
      ..longitude = entry['location']['longitude'];
    return new Feature()
      ..name = entry['name']
      ..location = location;
  }).toList();
}

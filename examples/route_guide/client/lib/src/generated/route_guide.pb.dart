///
//  Generated code. Do not modify.
//  source: route_guide.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

class Point extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Point', package: const $pb.PackageName('routeguide'))
    ..a<int>(1, 'latitude', $pb.PbFieldType.O3)
    ..a<int>(2, 'longitude', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Point() : super();
  Point.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Point.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Point clone() => new Point()..mergeFromMessage(this);
  Point copyWith(void Function(Point) updates) => super.copyWith((message) => updates(message as Point));
  $pb.BuilderInfo get info_ => _i;
  static Point create() => new Point();
  static $pb.PbList<Point> createRepeated() => new $pb.PbList<Point>();
  static Point getDefault() => _defaultInstance ??= create()..freeze();
  static Point _defaultInstance;
  static void $checkItem(Point v) {
    if (v is! Point) $pb.checkItemFailed(v, _i.messageName);
  }

  int get latitude => $_get(0, 0);
  set latitude(int v) { $_setSignedInt32(0, v); }
  bool hasLatitude() => $_has(0);
  void clearLatitude() => clearField(1);

  int get longitude => $_get(1, 0);
  set longitude(int v) { $_setSignedInt32(1, v); }
  bool hasLongitude() => $_has(1);
  void clearLongitude() => clearField(2);
}

class Rectangle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Rectangle', package: const $pb.PackageName('routeguide'))
    ..a<Point>(1, 'lo', $pb.PbFieldType.OM, Point.getDefault, Point.create)
    ..a<Point>(2, 'hi', $pb.PbFieldType.OM, Point.getDefault, Point.create)
    ..hasRequiredFields = false
  ;

  Rectangle() : super();
  Rectangle.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Rectangle.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Rectangle clone() => new Rectangle()..mergeFromMessage(this);
  Rectangle copyWith(void Function(Rectangle) updates) => super.copyWith((message) => updates(message as Rectangle));
  $pb.BuilderInfo get info_ => _i;
  static Rectangle create() => new Rectangle();
  static $pb.PbList<Rectangle> createRepeated() => new $pb.PbList<Rectangle>();
  static Rectangle getDefault() => _defaultInstance ??= create()..freeze();
  static Rectangle _defaultInstance;
  static void $checkItem(Rectangle v) {
    if (v is! Rectangle) $pb.checkItemFailed(v, _i.messageName);
  }

  Point get lo => $_getN(0);
  set lo(Point v) { setField(1, v); }
  bool hasLo() => $_has(0);
  void clearLo() => clearField(1);

  Point get hi => $_getN(1);
  set hi(Point v) { setField(2, v); }
  bool hasHi() => $_has(1);
  void clearHi() => clearField(2);
}

class Feature extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Feature', package: const $pb.PackageName('routeguide'))
    ..aOS(1, 'name')
    ..a<Point>(2, 'location', $pb.PbFieldType.OM, Point.getDefault, Point.create)
    ..hasRequiredFields = false
  ;

  Feature() : super();
  Feature.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Feature.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Feature clone() => new Feature()..mergeFromMessage(this);
  Feature copyWith(void Function(Feature) updates) => super.copyWith((message) => updates(message as Feature));
  $pb.BuilderInfo get info_ => _i;
  static Feature create() => new Feature();
  static $pb.PbList<Feature> createRepeated() => new $pb.PbList<Feature>();
  static Feature getDefault() => _defaultInstance ??= create()..freeze();
  static Feature _defaultInstance;
  static void $checkItem(Feature v) {
    if (v is! Feature) $pb.checkItemFailed(v, _i.messageName);
  }

  String get name => $_getS(0, '');
  set name(String v) { $_setString(0, v); }
  bool hasName() => $_has(0);
  void clearName() => clearField(1);

  Point get location => $_getN(1);
  set location(Point v) { setField(2, v); }
  bool hasLocation() => $_has(1);
  void clearLocation() => clearField(2);
}

class RouteNote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('RouteNote', package: const $pb.PackageName('routeguide'))
    ..a<Point>(1, 'location', $pb.PbFieldType.OM, Point.getDefault, Point.create)
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  RouteNote() : super();
  RouteNote.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RouteNote.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RouteNote clone() => new RouteNote()..mergeFromMessage(this);
  RouteNote copyWith(void Function(RouteNote) updates) => super.copyWith((message) => updates(message as RouteNote));
  $pb.BuilderInfo get info_ => _i;
  static RouteNote create() => new RouteNote();
  static $pb.PbList<RouteNote> createRepeated() => new $pb.PbList<RouteNote>();
  static RouteNote getDefault() => _defaultInstance ??= create()..freeze();
  static RouteNote _defaultInstance;
  static void $checkItem(RouteNote v) {
    if (v is! RouteNote) $pb.checkItemFailed(v, _i.messageName);
  }

  Point get location => $_getN(0);
  set location(Point v) { setField(1, v); }
  bool hasLocation() => $_has(0);
  void clearLocation() => clearField(1);

  String get message => $_getS(1, '');
  set message(String v) { $_setString(1, v); }
  bool hasMessage() => $_has(1);
  void clearMessage() => clearField(2);
}

class RouteSummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('RouteSummary', package: const $pb.PackageName('routeguide'))
    ..a<int>(1, 'pointCount', $pb.PbFieldType.O3)
    ..a<int>(2, 'featureCount', $pb.PbFieldType.O3)
    ..a<int>(3, 'distance', $pb.PbFieldType.O3)
    ..a<int>(4, 'elapsedTime', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RouteSummary() : super();
  RouteSummary.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RouteSummary.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RouteSummary clone() => new RouteSummary()..mergeFromMessage(this);
  RouteSummary copyWith(void Function(RouteSummary) updates) => super.copyWith((message) => updates(message as RouteSummary));
  $pb.BuilderInfo get info_ => _i;
  static RouteSummary create() => new RouteSummary();
  static $pb.PbList<RouteSummary> createRepeated() => new $pb.PbList<RouteSummary>();
  static RouteSummary getDefault() => _defaultInstance ??= create()..freeze();
  static RouteSummary _defaultInstance;
  static void $checkItem(RouteSummary v) {
    if (v is! RouteSummary) $pb.checkItemFailed(v, _i.messageName);
  }

  int get pointCount => $_get(0, 0);
  set pointCount(int v) { $_setSignedInt32(0, v); }
  bool hasPointCount() => $_has(0);
  void clearPointCount() => clearField(1);

  int get featureCount => $_get(1, 0);
  set featureCount(int v) { $_setSignedInt32(1, v); }
  bool hasFeatureCount() => $_has(1);
  void clearFeatureCount() => clearField(2);

  int get distance => $_get(2, 0);
  set distance(int v) { $_setSignedInt32(2, v); }
  bool hasDistance() => $_has(2);
  void clearDistance() => clearField(3);

  int get elapsedTime => $_get(3, 0);
  set elapsedTime(int v) { $_setSignedInt32(3, v); }
  bool hasElapsedTime() => $_has(3);
  void clearElapsedTime() => clearField(4);
}


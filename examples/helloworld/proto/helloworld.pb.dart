///
//  Generated code. Do not modify.
//  source: helloworld.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

class HelloRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('HelloRequest', package: const $pb.PackageName('helloworld'))
    ..aOS(1, 'name')
    ..hasRequiredFields = false
  ;

  HelloRequest() : super();
  HelloRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HelloRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HelloRequest clone() => new HelloRequest()..mergeFromMessage(this);
  HelloRequest copyWith(void Function(HelloRequest) updates) => super.copyWith((message) => updates(message as HelloRequest));
  $pb.BuilderInfo get info_ => _i;
  static HelloRequest create() => new HelloRequest();
  static $pb.PbList<HelloRequest> createRepeated() => new $pb.PbList<HelloRequest>();
  static HelloRequest getDefault() => _defaultInstance ??= create()..freeze();
  static HelloRequest _defaultInstance;
  static void $checkItem(HelloRequest v) {
    if (v is! HelloRequest) $pb.checkItemFailed(v, _i.messageName);
  }

  String get name => $_getS(0, '');
  set name(String v) { $_setString(0, v); }
  bool hasName() => $_has(0);
  void clearName() => clearField(1);
}

class HelloResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('HelloResponse', package: const $pb.PackageName('helloworld'))
    ..aOS(1, 'message')
    ..hasRequiredFields = false
  ;

  HelloResponse() : super();
  HelloResponse.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HelloResponse.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HelloResponse clone() => new HelloResponse()..mergeFromMessage(this);
  HelloResponse copyWith(void Function(HelloResponse) updates) => super.copyWith((message) => updates(message as HelloResponse));
  $pb.BuilderInfo get info_ => _i;
  static HelloResponse create() => new HelloResponse();
  static $pb.PbList<HelloResponse> createRepeated() => new $pb.PbList<HelloResponse>();
  static HelloResponse getDefault() => _defaultInstance ??= create()..freeze();
  static HelloResponse _defaultInstance;
  static void $checkItem(HelloResponse v) {
    if (v is! HelloResponse) $pb.checkItemFailed(v, _i.messageName);
  }

  String get message => $_getS(0, '');
  set message(String v) { $_setString(0, v); }
  bool hasMessage() => $_has(0);
  void clearMessage() => clearField(1);
}


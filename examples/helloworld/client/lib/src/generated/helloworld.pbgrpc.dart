///
//  Generated code. Do not modify.
//  source: helloworld.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'helloworld.pb.dart';
export 'helloworld.pb.dart';

class GreeterClient extends Client {
  static final _$sayHello = new ClientMethod<HelloRequest, HelloResponse>(
      '/helloworld.Greeter/SayHello',
      (HelloRequest value) => value.writeToBuffer(),
      (List<int> value) => new HelloResponse.fromBuffer(value));
  static final _$sayHelloAgain = new ClientMethod<HelloRequest, HelloResponse>(
      '/helloworld.Greeter/SayHelloAgain',
      (HelloRequest value) => value.writeToBuffer(),
      (List<int> value) => new HelloResponse.fromBuffer(value));

  GreeterClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<HelloResponse> sayHello(HelloRequest request,
      {CallOptions options}) {
    final call = $createCall(_$sayHello, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<HelloResponse> sayHelloAgain(HelloRequest request,
      {CallOptions options}) {
    final call = $createCall(
        _$sayHelloAgain, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class GreeterServiceBase extends Service {
  String get $name => 'helloworld.Greeter';

  GreeterServiceBase() {
    $addMethod(new ServiceMethod<HelloRequest, HelloResponse>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        (List<int> value) => new HelloRequest.fromBuffer(value),
        (HelloResponse value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<HelloRequest, HelloResponse>(
        'SayHelloAgain',
        sayHelloAgain_Pre,
        false,
        false,
        (List<int> value) => new HelloRequest.fromBuffer(value),
        (HelloResponse value) => value.writeToBuffer()));
  }

  Future<HelloResponse> sayHello_Pre(ServiceCall call, Future request) async {
    return sayHello(call, await request);
  }

  Future<HelloResponse> sayHelloAgain_Pre(
      ServiceCall call, Future request) async {
    return sayHelloAgain(call, await request);
  }

  Future<HelloResponse> sayHello(ServiceCall call, HelloRequest request);
  Future<HelloResponse> sayHelloAgain(ServiceCall call, HelloRequest request);
}

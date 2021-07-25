import 'package:fixnum/fixnum.dart';
import 'package:flutter_auth/Proto/helloworld.pbgrpc.dart';
import 'package:flutter_auth/Proto/server.pbgrpc.dart';
import 'package:flutter_auth/Services/Utility/custom_grpc.dart';

class TestGrpc {
  static Future<dynamic> add(int a, int b) async {
    try {
      print({'assd': GrpcClient.getClient()});
      var client = AddServiceClient(GrpcClient.getClient());
      Request request = Request.create();
      request.a = Int64(a);
      request.b = Int64(b);
      final response =  await client.add(request);
      return response;
    } catch (e, s) {
      print({'e': e});
      print({'s': s});
    }
  }

  static Future<HelloReply> sayHello(List<String> args) async {
    try {
      print({'assd': GrpcClient.getClient().port});
      var client = GreeterClient(GrpcClient.getClient());
      final response = await client.sayHello(
        HelloRequest()..name = args.isNotEmpty ? args[0] : 'world',
      );
      print({'responsee': response.message});
      return response;
    } catch (e, s) {
      print({'e': e});
      print({'s': s});
    }
  }
}

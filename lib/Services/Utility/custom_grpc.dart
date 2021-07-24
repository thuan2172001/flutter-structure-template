import 'package:grpc/grpc.dart';
class GrpcClient {
  ClientChannel client;

  static final GrpcClient _singleton = new GrpcClient._internal();

  factory GrpcClient() => _singleton;

  GrpcClient._internal() {
    client = ClientChannel("host",
        port: 3000,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ));
  }
}
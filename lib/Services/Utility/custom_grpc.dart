import 'package:grpc/grpc.dart';

class GrpcClient {
  static ClientChannel _client;

  static ClientChannel getClient() {
    if (_client == null) { 
      _client = ClientChannel(
        '192.168.1.70',
        port: 50051,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          codecRegistry:
              CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
        ),
      );
    }
    return _client;
  }

  static shutdown() async {
    await _client.shutdown();
  }
}

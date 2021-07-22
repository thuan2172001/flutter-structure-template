import 'dart:convert';

import 'package:flutter_auth/Services/Entity/time_service.dart';
import 'package:flutter_auth/Services/Utility/certificate_service.dart';

class SignatureService {
  static getCertificateInfo(String username) {
    var certificateInfo = jsonEncode({
      "username": username,
      "timestamp": TimeService.getTimeNow().toString(),
      "exp": 3600000 * 24 * 30
    });
    return certificateInfo;
  }

  static String getSignature(var certificateInfo, String privateKey) {
    var hashCertificateInfo = hashMessage(certificateInfo);
    var signature = signMessage(privateKey, hashCertificateInfo);
    return signature;
  }

  static String getCertificate(
      var certificateInfo, String signature, String publicKey) {
    var certificate = jsonEncode({
      "signature": signature,
      "certificateInfo": jsonDecode(certificateInfo),
      "publicKey": publicKey,
    });
    return certificate;
  }

  static String getCertificateLogin(
      var certificateInfo, String signature, String publicKey, String time) {
    var certificate = jsonEncode({
      "signature": signature,
      "certificateInfo": jsonDecode(certificateInfo),
      "publicKey": publicKey,
      "_actionType": "POST_API-AUTH-PING",
      "_timestamp": time
    });
    return certificate;
  }

  static getCertificateFinal(var certificateInfo, String signature,
      String _signature, String publicKey, String time) {
    var certificateFinal = jsonEncode({
      "signature": signature,
      "certificateInfo": jsonDecode(certificateInfo),
      "publicKey": publicKey,
      "_signature": _signature,
      "_actionType": "POST_API-AUTH-PING",
      "_timestamp": time
    });
    return certificateFinal;
  }
}

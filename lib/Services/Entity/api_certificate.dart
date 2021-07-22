import 'package:flutter_auth/Services/Entity/signature_service.dart';
import 'package:flutter_auth/Services/Storage/user_storage_service.dart';

class CertificateApiService {
  static String getCertificate() {
    var certificateInfo = SignatureService.getCertificateInfo(
        UserStorageService.getUser().username);

    String signature = SignatureService.getSignature(
        certificateInfo, UserStorageService.getUser().privateKey);

    String certificate = SignatureService.getCertificate(
        certificateInfo, signature, UserStorageService.getUser().publicKey);
    return certificate;
  }

  static String getCertificateNewPassword(
      String userName, String publicKey, String privateKey) {
    var certificateInfo = SignatureService.getCertificateInfo(userName);

    String signature =
        SignatureService.getSignature(certificateInfo, privateKey);

    String certificate =
        SignatureService.getCertificate(certificateInfo, signature, publicKey);
    return certificate;
  }
}

class User {
  String id;
  String username;
  String certification;
  String fullName;
  String email;
  String privateKey;
  String publicKey;
  String encryptedPrivateKey;
  String code;
  String role;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'fullName': fullName,
      'certification': certification,
      'email': email,
      'publicKey': publicKey,
      'privateKey': privateKey,
      'encryptedPrivateKey': encryptedPrivateKey,
      'code': code,
      'role': role,
    };
  }
}

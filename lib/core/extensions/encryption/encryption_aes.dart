import 'package:boilerplate/constants/strings.dart';
import 'package:encrypt/encrypt.dart';

class EncryptionAES {
  EncryptionAES();

  final IV iv = IV.fromLength(16);
  final Encrypter encrypter =
      Encrypter(AES(Key.fromUtf8(Strings.encryptionKey)));

  Encrypted getEncrypted(String value) {
    return encrypter.encrypt(value, iv: iv);
  }

  String getDecrypted(Encrypted value) {
    return encrypter.decrypt(value, iv: iv);
  }
}

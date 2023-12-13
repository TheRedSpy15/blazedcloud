import 'dart:convert';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pocketbase/pocketbase.dart';

class CustomAuthStore extends AuthStore {
  @override
  void clear() {
    super.clear();

    Hive.deleteBoxFromDisk('vaultBox');
    const FlutterSecureStorage().delete(key: 'key');
    Hive.deleteBoxFromDisk('points');
    Hive.deleteBoxFromDisk('history');
  }

  isAuthBoxPresent() async {
    final box = await Hive.openBox('vaultBox');
    return box.isNotEmpty;
  }

  Future<CustomAuthStore?> loadAuth() async {
    // Load the encryption key from secure storage
    const secureStorage = FlutterSecureStorage();
    final encryptionKeyString = await secureStorage.read(key: 'key');
    if (encryptionKeyString == null) {
      // Generate a new key if one does not exist
      logger.d("generating new key");
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    } else {
      logger.d("key already exists");
    }

    // Open the encrypted box
    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);

    // load data from hive
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

    final data = encryptedBox.get('auth');
    if (data != null) {
      logger.d("loaded auth from hive");

      final decoded = jsonDecode(data);
      final token = (decoded as Map<String, dynamic>)["token"] as String? ?? "";
      final model =
          RecordModel.fromJson(decoded["model"] as Map<String, dynamic>? ?? {});

      save(token, model);
      logger.d("applied auth from hive");
    } else {
      logger.d("no auth in hive");
    }

    try {
      pb.collection('users').authRefresh(headers: {"Authorization": token});
    } catch (e) {
      logger.e("auth refresh failed");

      // clear auth
      clear();

      // clear hive
      Hive.deleteBoxFromDisk('vaultBox');

      // clear secure storage
      secureStorage.delete(key: 'key');

      return null;
    }

    return this;
  }

  @override
  CustomAuthStore save(
    String newToken,
    dynamic /* RecordModel|AdminModel|null */ newModel,
  ) {
    super.save(newToken, newModel);

    saveAuth(newToken, newModel);

    return this;
  }

  saveAuth(
    String newToken,
    dynamic newModel,
  ) async {
    final encoded =
        jsonEncode(<String, dynamic>{"token": newToken, "model": newModel});
    logger.d("saving auth to hive");

    // Load the encryption key from secure storage
    const secureStorage = FlutterSecureStorage();
    final encryptionKeyString = await secureStorage.read(key: 'key');
    if (encryptionKeyString == null) {
      // Generate a new key if one does not exist
      logger.d("generating new key");
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    } else {
      logger.d("key already exists");
    }

    // Open the encrypted box
    final key = await secureStorage.read(key: 'key');
    final encryptionKeyUint8List = base64Url.decode(key!);

    // save data to hive
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    encryptedBox.put('auth', encoded);
    logger.d("saved auth to hive");

    return this;
  }
}

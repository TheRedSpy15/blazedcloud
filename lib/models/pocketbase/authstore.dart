import 'dart:convert';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pocketbase/pocketbase.dart';

FlutterSecureStorage? secureStorage;

AndroidOptions getAndroidSecureOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

FlutterSecureStorage getSecureStorage() {
  if (secureStorage == null) {
    secureStorage = FlutterSecureStorage(aOptions: getAndroidSecureOptions());
    return secureStorage!;
  }
  return secureStorage!;
}

class CustomAuthStore extends AuthStore {
  @override
  void clear() {
    super.clear();

    getSecureStorage().deleteAll();
  }

  Future<CustomAuthStore?> loadAuth() async {
    try {
      const storage = FlutterSecureStorage();

      if (!await storage.containsKey(
          key: "auth", aOptions: getAndroidSecureOptions())) {
        logger.e("no auth record found");
        return null;
      }

      String data = await storage.read(
              key: "auth", aOptions: getAndroidSecureOptions()) ??
          "";
      if (data.isEmpty) {
        logger.e("auth is empty");
        return null;
      }

      final decoded = jsonDecode(data);

      final token = (decoded as Map<String, dynamic>)["token"] as String? ?? "";
      if (token.isEmpty) {
        logger.e("token is empty");
        storage.deleteAll();
        return null;
      }

      final model =
          RecordModel.fromJson(decoded["model"] as Map<String, dynamic>? ?? {});

      save(token, model);

      await pb
          .collection('users')
          .authRefresh(headers: {"Authorization": token});
    } catch (e) {
      logger.e("auth refresh failed");

      // clear auth
      clear();
      getSecureStorage().deleteAll();

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

    final encoded =
        jsonEncode(<String, dynamic>{"token": newToken, "model": newModel});
    logger.d("saving auth to secure storage");

    getSecureStorage().write(
        key: "auth", value: encoded, aOptions: getAndroidSecureOptions());
    logger.d("saved auth to secure storage\n$encoded");

    return this;
  }
}

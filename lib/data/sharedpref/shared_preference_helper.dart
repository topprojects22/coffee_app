import 'dart:async';

import 'package:boilerplate/core/extensions/encryption/encryption_aes.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt_shared_pref/pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boilerplate/data/sharedpref/constants/preferences.dart';

class SharedPreferenceHelper {

  // constructor
  SharedPreferenceHelper(this._sharedPreference);
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.authToken);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.isLoggedIn, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(Preferences.isDarkMode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(Preferences.isDarkMode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.currentLanguage);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.currentLanguage, language);
  }

  // Subscription:---------------------------------------------------

  Future<void> setSubscriptionDate(DateTime date) async {
    final SecureStorage secureStorage = SecureStorage();
    secureStorage.writeInt(
        isEncrypted: true, key: 'subscriptionDate', value: date.millisecond);
  }

  Future<int?> getSubscriptionDate() async {
    final SecureStorage secureStorage = SecureStorage();
    return secureStorage.readInt(key: 'subscriptionDate', isEncrypted: true);
  }
}

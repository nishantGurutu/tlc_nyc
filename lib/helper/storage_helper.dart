import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? _preferences;

  static Future<void> initialize() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> clear() async {
    await _preferences?.clear();
  }

  static const String _keyId = "_id";
  static const String _keyName = "name";
  static const String _keyEmail = "email";
  static const String _keyPhone = "mobile";
  static const String _keyImage = "image";
  static const String _role = "role";
  static const String _token = "token";

  // Set methods
  static Future<void> setId(String id) async =>
      await _preferences?.setString(_keyId, id);
  static Future<void> setName(String name) async =>
      await _preferences?.setString(_keyName, name);
  static Future<void> setEmail(String email) async =>
      await _preferences?.setString(_keyEmail, email);
  static Future<void> setPhone(String phone) async =>
      await _preferences?.setString(_keyPhone, phone);
  static Future<void> setImage(String image) async =>
      await _preferences?.setString(_keyImage, image);
  static Future<void> setRole(String role) async =>
      await _preferences?.setString(_role, role);

  static Future<void> setToken(String token) async =>
      await _preferences?.setString(_token, token);

  // Get methods
  static dynamic getId() => _preferences?.getInt(_keyId);
  static dynamic getName() => _preferences?.getString(_keyName);
  static dynamic getEmail() => _preferences?.getString(_keyEmail);
  static dynamic getPhone() => _preferences?.getString(_keyPhone);
  static dynamic getImage() => _preferences?.getString(_keyImage);
  static dynamic getRole() => _preferences?.getString(_role);
  static dynamic getToken() => _preferences?.getString(_token);
}

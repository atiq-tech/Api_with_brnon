import 'package:ecom/core/constants/share_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenDatasource {
  late SharedPreferences _preferences;

  TokenDatasource(this._preferences);
  Future<bool> save(String token) async {
    bool isTokenSaved =
        await _preferences.setString(SharePreferencekeys.TOKEN, token);
    if (isTokenSaved) {
      return true;
    }
    return false;
  }

  String? get() {
    return _preferences.getString(SharePreferencekeys.TOKEN);
  }

  Future<bool> delete() async {
    return await _preferences.remove(SharePreferencekeys.TOKEN);
  }
}

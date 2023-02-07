import 'dart:async';

import 'package:ecom/core/constants/share_preference_keys.dart';
import 'package:ecom/datasources/token_datasource.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware {
  static FutureOr<String> guardMiddleLogin() async {
    // if user is already loggedin
    SharedPreferences sharePreference = await SharedPreferences.getInstance();
    TokenDatasource tokenDatasource = TokenDatasource(sharePreference);

    if ((await tokenDatasource.get()) == null) {
      return Future.value(RouteNames.LOGIN);
    }
// if user is not loggedin
    return RouteNames.MAIN_PAGE;
  }
}

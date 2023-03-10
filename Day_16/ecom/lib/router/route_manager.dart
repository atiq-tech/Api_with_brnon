import 'package:ecom/pages/home_page.dart';
import 'package:ecom/pages/login_page.dart';
import 'package:ecom/pages/main_pages/ui/main_page.dart';
import 'package:ecom/router/middlewares/auth_middleware.dart';
import 'package:go_router/go_router.dart';

class RouteManager {
  static final routeConfig = GoRouter(
    routes: [
      GoRoute(
          name: RouteNames.MAIN_PAGE,
          path: RouteNames.MAIN_PAGE,
          builder: (context, state) => const MainPage(),
          redirect: (context, state) {
            return AuthMiddleware.guardMiddleLogin();
          }),
      GoRoute(
          name: RouteNames.LOGIN,
          path: RouteNames.LOGIN,
          builder: (context, state) => const LoginPage()),
    ],
  );
}

abstract class RouteNames {
  static String MAIN_PAGE = "/main";
  static String LOGIN = '/';
}

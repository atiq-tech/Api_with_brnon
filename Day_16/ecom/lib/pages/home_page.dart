import 'package:ecom/core/constants/share_preference_keys.dart';
import 'package:ecom/datasources/token_datasource.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Home Page'),
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                TokenDatasource tokenDatasource =
                    TokenDatasource(sharedPreferences);
                if (await tokenDatasource.delete()) {
                  print("Logged out");
                } else {
                  print("Logging out Failed");
                }
                context.goNamed(RouteNames.LOGIN);
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}

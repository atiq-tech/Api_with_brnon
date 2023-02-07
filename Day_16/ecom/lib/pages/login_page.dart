import 'dart:ui';

import 'package:ecom/core/constants/asset_icon_tabbar.dart';
import 'package:ecom/core/constants/my_colors.dart';
import 'package:ecom/core/widgets/my_app_bar.dart';
import 'package:ecom/providers/auth_provider.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.goNamed(RouteNames.MAIN_PAGE);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              MyAppBar(
                hedertxt: "Hello,Welcome 👋",
                HeaderName: "Lets Login or Signup",
              ),
              _LogoSection(),
              _LoginSignupFormSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: Image.asset(
          "assets/graphics/common/logo.png",
          width: 177.w,
        ),
      ),
    );
  }
}

// class _AppBarSection extends StatelessWidget {
//   const _AppBarSection({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Hello,Welcome 👋",
//               style: TextStyle(fontSize: 14.sp),
//             ),
//             Text(
//               "Lets Login or Signup",
//               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         CircleAvatar(
//           backgroundImage:
//               AssetImage("assets/graphics/common/profile-ecom.png"),
//         )
//       ],
//     );
//   }
// }

class _LoginSignupFormSection extends StatelessWidget {
  _LoginSignupFormSection({super.key});

  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User name",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        TextField(
          controller: _usernameTextController,
          decoration: InputDecoration(
            hintText: "example:iftikarislamatik@gmail.com",
            fillColor: MyColors.inputBackground,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "Password",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Your password",
            fillColor: MyColors.inputBackground,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 26.0, horizontal: 18.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Consumer<AuthProvider>(
            builder: (context, authProvider, _) => authProvider.hasError
                ? Center(
                    child: Text(
                    "${authProvider.errorMessage}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w700),
                  ))
                : Container()),
        SizedBox(
          height: 26.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                )),
            onPressed: () async {
              //getting email & password tex
              String username = _usernameTextController.text;
              String password = _passwordTextController.text;
              bool isLoginSuccess =
                  await Provider.of<AuthProvider>(context, listen: false)
                      .Login(username, password);
              if (isLoginSuccess) {
                context.goNamed(RouteNames.MAIN_PAGE);
              }
            },
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, _) => authProvider.isloading
                  ? CircularProgressIndicator(
                      color: MyColors.inputBackground,
                    )
                  : Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: MyColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                )),
            onPressed: () {
              context.goNamed(RouteNames.MAIN_PAGE);
            },
            child: Text(
              "Signup",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

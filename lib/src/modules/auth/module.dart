import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'export.dart';
import 'presentation/profile/current_user/edit_profile_screen.dart';
import 'presentation/register/index.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepoImp()),
        Bind((i) => UserRepoImp()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AuthScreen()),
        ModularRouter(LOGIN, child: (_, args) => LoginScreen()),
        ModularRouter(PROFILE, child: (_, args) => ProfileScreen()),
        ModularRouter(
          '$PROFILE/:id',
          child: (_, args) => OtherUserProfile(args.params['id']),
        ),
      ];

  static const LOGIN = '/login', PROFILE = '/profile';
  static Future toMyProfile() => Modular.to.pushNamed(PROFILE);

  static Future toOtherUserProfile(String id) =>
      Modular.to.pushNamedAndRemoveUntil('$PROFILE${'/$id'}', (route) {
        return !(route.settings.name ?? '').startsWith(PROFILE);
      });

  //static Future toOtpVerification() => _to(OtpVerificationScreen());
  static Future toRegister() => _to(RegisterScreen());
  static Future toEditProfile() => _to(EditProfileScreen());

  static Future _to(Widget screen) =>
      Modular.to.navigator.push(MaterialPageRoute(builder: (_) => screen));
}

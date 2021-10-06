import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../export.dart';

part 'controller.g.dart';

class LoginController extends _LoginController
    with _$LoginController
    implements Disposable {
  @override
  void dispose() {
    super.dispose();
  }
}

abstract class _LoginController with Store {
  final authRepo = Modular.get<AuthRepository>();
  final userRepo = Modular.get<UserRepository>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @observable
  String userName;

  @observable
  String password;

  @observable
  String email;

  @observable
  bool isLogging = false;

  @action
  Future<void> checkUserNameValidation() async {
    userName = '${userNameController.text}';
    password = '${passwordController.text}';
    if (userName == '' || password == '') {
      BotToast.showText(text: 'UserName or Password is empty');
      return;
    }
    isLogging = true;

    try {
      var email = await authRepo.checkUserName(userName);
      final uid = await authRepo.emailLogin(email, password);

      if (uid != null) {
        //Modular.to.pop();
        await Modular.get<AuthController>().addEvent(AuthEvent.loggedIn(uid));
      }
    } on CustomAuthException catch (e) {
      BotToast.showText(text: e.error);
      isLogging = false;
    }
  }

  @action
  Future<void> sendEmailResetCode() async {
    email = emailController.text;
    await authRepo.passwordReset(email);
    Modular.to.pop();
  }

  void dispose() {
    passwordController.dispose();
    userNameController.dispose();
    emailController.dispose();
  }
}

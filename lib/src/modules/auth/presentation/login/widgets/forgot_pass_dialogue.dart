import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../i18n/strings.g.dart';
import '../../../../../common/custom_text_form.dart';
import '../../widgets/login_button.dart';
import '../controller.dart';

final controller = Modular.get<LoginController>();

void showForgotPassDialogue(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: <Widget>[
                Text(t.Auth.enter_email),
                CustomTextForm(
                  label: t.Auth.email,
                  icon: Icons.email,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 20,
                ),
                LoginButton(
                  t.Auth.send_mail,
                  onTap: controller.sendEmailResetCode,
                ),
              ],
            ),
          ),
        );
      });
}

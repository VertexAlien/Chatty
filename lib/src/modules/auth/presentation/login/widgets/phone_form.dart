import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_social_messenger/i18n/strings.g.dart';

import '../controller.dart';

class PhoneFormWidget extends StatefulWidget {
  @override
  _PhoneFormWidgetState createState() => _PhoneFormWidgetState();
}

class _PhoneFormWidgetState extends State<PhoneFormWidget> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          //Phone Code
          TextFormField(
            controller: controller.userNameController,
            keyboardType: TextInputType.emailAddress,
            //maxLength: 3,
            decoration: InputDecoration(
              labelText: t.Auth.name,
              counter: SizedBox.shrink(),
            ),
            onChanged: (str) {},
          ),

          //Phone Number Main TextField
          TextFormField(
            controller: controller.passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              counter: SizedBox.shrink(),
              labelText: t.Auth.password,
            ),
          ),
        ],
      ),
    );
  }

  // void _countryPickerTapped() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Theme(
  //       data: Theme.of(context).copyWith(primaryColor: Colors.pink),
  //       child: CountryPickerDialog(
  //         titlePadding: EdgeInsets.all(8.0),
  //         searchCursorColor: Colors.pinkAccent,
  //         searchInputDecoration: InputDecoration(hintText: 'Search...'),
  //         isSearchable: true,
  //         title: Text('Select your phone code'),
  //         onValuePicked: (_selectedDialogCountry) {
  //           controller.userNameController.text =
  //               '+${_selectedDialogCountry.phoneCode}';
  //           controller.country = _selectedDialogCountry;
  //         },
  //         itemBuilder: (country) => ListTile(
  //           contentPadding: EdgeInsets.all(0),
  //           title: Text('+${country.phoneCode}  (${country.name})'),
  //           leading: CountryPickerUtils.getDefaultFlagImage(country),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

import 'package:badges/badges.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../subscriptions/presentation/index.dart';
import '../../export.dart';
import 'menu_item.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appStore = Modular.get<AppStore>();
    final currentUser = Modular.get<AuthController>().currentUser;
    return Container(
      width: 75,
      color: theme.accentColor.withAlpha(60),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          MenuItem(
            icon: Icon(
              Icons.group,
              color: Colors.black,
            ),
            title: t.Settings.groups_msgs,
            drawerState: DrawerState.GROUPS,
            action: () {
              appStore.drawerState = DrawerState.GROUPS;
            },
          ),
          Container(
            color: theme.secondaryHeaderColor,
            height: 2,
            width: 48,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          MenuItem(
            icon: Badge(
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
            title: t.Drawer.notifications,
            drawerState: DrawerState.FEED,
            action: () {
              appStore.drawerState = DrawerState.FEED;
            },
          ),
          Container(
            color: theme.primaryColorDark,
            height: 2,
            width: 48,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          MenuItem(
            icon: Icon(
              Icons.subscriptions,
              color: Colors.black,
            ),
            title: t.Drawer.Subscriptions,
            action: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubscriptionPage(),
              ),
            ),
          ),
          Container(
            color: theme.primaryColorDark,
            height: 2,
            width: 48,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          if (currentUser.isSuperAdmin) ...[
            MenuItem(
              icon: Icon(
                FontAwesomeIcons.lock,
                color: Colors.black,
              ),
              title: t.Drawer.admin,
              action: AppModule.toAdminScreen,
            ),
            Container(
              color: Colors.red,
              height: 2,
              width: 48,
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
          ],
          Spacer(),
          Observer(
            builder: (_) => DayNightSwitcherIcon(
              isDarkModeEnabled: !appStore.isDarkMode,
              onStateChanged: (v) => appStore.setDarkMode(),
            ),
          ),
          SizedBox(height: 10),
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pop(context);
              AuthModule.toMyProfile();
            },
          ),
          SizedBox(height: 10),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pop(context);
              AppModule.toSettings();
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

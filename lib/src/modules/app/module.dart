import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../admin/module.dart';
import '../admin/presentation/index.dart';
import 'export.dart';
import 'presentation/settings/about.dart';

export 'domain/app_store.dart';

class AppModule extends MainModule {
  final appStore = AppStore();
  final authModule = AuthModule();
  final feedModule = FeedsModule();
  final chatModule = ChatModule();
  final groupsModule = GroupsModule();
  final notificationModule = NotificationModule();
  final analytics = FirebaseAnalytics();
  final adminModule = AdminModule();
  @override
  List<Bind> get binds => [
        Bind((_) => appStore),
        Bind((_) => analytics),
        ...authModule.binds,
        ...feedModule.binds,
        ...chatModule.binds,
        ...groupsModule.binds,
        ...notificationModule.binds,
        ...adminModule.binds,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('', module: authModule),
        ModularRouter('', module: feedModule),
        ModularRouter('', module: chatModule),
        ModularRouter('', module: groupsModule),
        ModularRouter('', module: notificationModule),
        ModularRouter('', module: adminModule),
        ModularRouter(SETTINGS, child: (_, args) => SettingsScreen()),
        ModularRouter(ABOUT, child: (_, args) => AboutScreen()),
      ];

  @override
  Widget get bootstrap => Observer(
        builder: (context) => MaterialApp(
          title: t.app_name,
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          navigatorKey: Modular.navigatorKey,
          builder: BotToastInit(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
            FirebaseAnalyticsObserver(analytics: analytics),
            appStore.routeObserver,
          ],
          themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          localizationsDelegates: [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('tr', 'TR'),
          ],
        ),
      );

  static const SETTINGS = '/settings', ABOUT = '/about';
  static Future toSettings() => Modular.to.pushNamed(SETTINGS);
  static Future toAbout() => Modular.to.pushNamed(ABOUT);
  static Future showFullImage(String url, {bool isLocal}) =>
      _to(ImageFullViewWidget(imgUrl: url, isLocal: isLocal));

  static Future toAdminScreen() => _to(AdminScreen());
  static Future _to(Widget screen) =>
      Modular.to.navigator.push(MaterialPageRoute(builder: (_) => screen));
}

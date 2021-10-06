import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_social_messenger/src/core/ad.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'i18n/strings.g.dart';
import 'src/modules/app/module.dart';

void main() async {
  InAppPurchaseConnection.enablePendingPurchases();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  if (!kIsWeb) {
    await LocaleSettings.useDeviceLocale();
  }
  runApp(ModularApp(module: AppModule()));
}

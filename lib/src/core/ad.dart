import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

int pageCount = 0;

// ignore: avoid_classes_with_only_static_members
class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7672074696817452~6547021465";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7672074696817452/8149809373";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7672074696817452/5136633220";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static BannerAd get bannerAd {
    return BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );
  }

  static void loadBannerAd({BannerAd bannerAd}) {
    bannerAd
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        horizontalCenterOffset: 60,
      );
  }

  bool _isInterstitialAdReady;

  void _onInterstitialAdEvent(MobileAdEvent event) {
    switch (event) {
      case MobileAdEvent.loaded:
        _isInterstitialAdReady = true;
        break;
      case MobileAdEvent.failedToLoad:
        _isInterstitialAdReady = false;
        print('Failed to load an interstitial ad');
        break;
      case MobileAdEvent.closed:
        break;
      default:
      // do nothing
    }
  }

  InterstitialAd interstitialAd() {
    return InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
      listener: _onInterstitialAdEvent,
    );
  }

  void loadInterstitialAd({InterstitialAd interstitialAd}) {
    interstitialAd
      ..load()
      ..show();
  }
}

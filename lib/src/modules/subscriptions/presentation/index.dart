import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_social_messenger/src/modules/subscriptions/presentation/widgets/subscripstion_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../i18n/strings.g.dart';
import '../../../core/ad.dart';
import '../../../core/assets.dart';
import '../../../core/utils.dart';
import '../../call/presentation/Widget/pickup_layout.dart';
import 'controller.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  SubsController subsController = SubsController();

  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;

  final adController = AdManager();
  InterstitialAd _interstitialAd;

  @override
  void initState() {
    if (pageCount >= 5) {
      _interstitialAd = adController.interstitialAd();

      adController.loadInterstitialAd(interstitialAd: _interstitialAd);
      pageCount = 0;
    } else {
      pageCount++;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialization();
    });

    subsController.initializePlayStore();

    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void initialization() async {
    await subsController.checkIfSubscribed();
  }

  void _buyProduct(ProductDetails prod) {
    final purchaseParam = PurchaseParam(productDetails: prod);
    _iap.buyConsumable(purchaseParam: purchaseParam);
  }

  void _checkPurchase() {
    if (subsController.isPurchased) {}
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PickUpLayout(
      scaffold: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            t.Subscriptions.subscription_header,
            style: GoogleFonts.abrilFatface(
              textStyle: theme.textTheme.headline6.copyWith(fontSize: 24),
            ),
          ),
        ),
        body: SafeArea(
          child: Observer(
            builder: (context) {
              return subsController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(theme.iconTheme.color),
                      ),
                    )
                  : subsController.isSubscribed
                      ? Container(
                          alignment: Alignment.center,
                          child: Text(t.Subscriptions.already_subscribed),
                        )
                      : SingleChildScrollView(
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.center,
                                  //color: Colors.blue,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                  child: Image.asset(AssetsHelper.LOGO),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        t.Subscriptions.voice_call_feature,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.videocam_rounded,
                                        color: Colors.redAccent,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        t.Subscriptions.video_call_feature,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.chat,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        t.Subscriptions.send_text_feature,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                SubscriptionButton(
                                  monthText: t.Subscriptions.one_month,
                                  descriptionText: t.Subscriptions.all_features,
                                  priceText: '\$0.99',
                                  onTap: () {
                                    if (subsController.available) {
                                      subsController.month = 1;
                                      _buyProduct(
                                          subsController.products.first);
                                      print(
                                          'product bought!+++++++++++++++++++');
                                      print("1 month subscribed! ");
                                    } else {
                                      showSnackBarMsg(Scaffold.of(context),
                                          'Google Play is not available!');
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SubscriptionButton(
                                  monthText: t.Subscriptions.six_month,
                                  descriptionText: t.Subscriptions.all_features,
                                  priceText: '\$5.99',
                                  onTap: () {
                                    if (subsController.available) {
                                      subsController.month = 6;
                                      _buyProduct(subsController.products[1]);
                                      print(
                                          'product bought!+++++++++++++++++++');
                                      print("6 month subscribed! ");
                                    } else {
                                      showSnackBarMsg(Scaffold.of(context),
                                          'Google Play is not available!');
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SubscriptionButton(
                                  monthText: t.Subscriptions.twelve_month,
                                  descriptionText: t.Subscriptions.all_features,
                                  priceText: '\$9.99',
                                  onTap: () {
                                    if (subsController.available) {
                                      subsController.month = 12;
                                      _buyProduct(subsController.products.last);
                                      print(
                                          'product bought!+++++++++++++++++++');
                                      print("12 month subscribed! ");
                                    } else {
                                      showSnackBarMsg(Scaffold.of(context),
                                          'Google Play is not available!');
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}

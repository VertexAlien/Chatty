import 'dart:async';
import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:mobx/mobx.dart';

import '../../auth/presentation/auth/controller.dart';
import '../data/sub_repo.dart';
import '../domain/subs.dart';

part 'controller.g.dart';

class SubsController = _SubsController with _$SubsController;

abstract class _SubsController with Store {
  final subRepository = SubRepository();
  var currentUser = Modular.get<AuthController>().currentUser;

  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  bool available = true;
  StreamSubscription subscription;
  // final String myProductId = 'chatty.1.month.subs';
  static const _productIds = {
    'chatty.1.month.subs',
    'chatty.6.month.subs',
    'chatty.12.month.subs',
  };

  int month;

  @observable
  bool isPurchased = false;

  // @observable
  // List purchases = [];

  @observable
  List products = [];

  @observable
  bool isLoading;

  @observable
  bool isSubscribed;

  @action
  Future<void> subscribe({int month}) async {
    isLoading = true;
    var startDate = DateTime.now();
    var endDate = startDate.add(Duration(days: month * 30));

    var sub = Subs(
      months: month,
      startDate: startDate,
      endDate: endDate,
      orderId: Random().nextInt(10000).toString(),
      userId: currentUser.id,
    );

    var subscribed = await subRepository.registerSub(sub);

    if (subscribed) {
      isSubscribed = true;
    } else {
      isSubscribed = false;
    }

    isLoading = false;
  }

  @action
  Future<void> checkIfSubscribed() async {
    isLoading = true;
    print("checked if subscribed before :  $isSubscribed");
    isSubscribed = await subRepository.checkSubscription(currentUser.id);
    print("checked if subscribed after :  $isSubscribed");
    isLoading = false;
  }

  @action
  Future<void> initializePlayStore() async {
    available = await _iap.isAvailable();
    if (available) {
      print('store ready!');
      await _getProducts();
      //await _getPastPurchases();

      //verifyPurchase();

      subscription = _iap.purchaseUpdatedStream.listen(
        (purchaseDetailsList) {
          _listenToPurchaseUpdated(purchaseDetailsList);
          //purchases.addAll(data);
          //verifyPurchase();
        },
        onDone: () {
          //subscription.cancel();
        },
      );
    }
  }

  _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // show progress bar or something
        isLoading = true;
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // show error message or failure icon
          isLoading = false;
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          // show success message and deliver the product.
          subscribe(month: month);
          isLoading = false;
        }
      }
    });
  }

  // @action
  // void verifyPurchase() {
  //   PurchaseDetails purchase = hasPurchased(myProductId);
  //
  //   if (purchase != null && purchase.status == PurchaseStatus.purchased) {
  //     if (purchase.pendingCompletePurchase) {
  //       _iap.completePurchase(purchase);
  //       isPurchased = true;
  //     }
  //   }
  // }

  // PurchaseDetails hasPurchased(String productID) {
  //   return purchases.firstWhere((purchase) => purchase.productID == productID,
  //       orElse: () => null);
  // }

  @action
  Future<void> _getProducts() async {
    //Set<String> ids = Set.from([_productIds]);
    ProductDetailsResponse response =
        await _iap.queryProductDetails(_productIds);
    if (response.error == null) {
      products = response.productDetails;
    }
  }

  // @action
  // Future<void> _getPastPurchases() async {
  //   QueryPurchaseDetailsResponse responce = await _iap.queryPastPurchases();
  //   for (var purchase in responce.pastPurchases) {
  //     if (Platform.isIOS) {
  //       _iap.consumePurchase(purchase);
  //     }
  //   }
  //   purchases = responce.pastPurchases;
  // }
}

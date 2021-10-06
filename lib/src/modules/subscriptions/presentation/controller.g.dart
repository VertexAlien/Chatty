// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubsController on _SubsController, Store {
  final _$isPurchasedAtom = Atom(name: '_SubsController.isPurchased');

  @override
  bool get isPurchased {
    _$isPurchasedAtom.reportRead();
    return super.isPurchased;
  }

  @override
  set isPurchased(bool value) {
    _$isPurchasedAtom.reportWrite(value, super.isPurchased, () {
      super.isPurchased = value;
    });
  }

  final _$productsAtom = Atom(name: '_SubsController.products');

  @override
  List<dynamic> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<dynamic> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SubsController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isSubscribedAtom = Atom(name: '_SubsController.isSubscribed');

  @override
  bool get isSubscribed {
    _$isSubscribedAtom.reportRead();
    return super.isSubscribed;
  }

  @override
  set isSubscribed(bool value) {
    _$isSubscribedAtom.reportWrite(value, super.isSubscribed, () {
      super.isSubscribed = value;
    });
  }

  final _$subscribeAsyncAction = AsyncAction('_SubsController.subscribe');

  @override
  Future<void> subscribe({int month}) {
    return _$subscribeAsyncAction.run(() => super.subscribe(month: month));
  }

  final _$checkIfSubscribedAsyncAction =
      AsyncAction('_SubsController.checkIfSubscribed');

  @override
  Future<void> checkIfSubscribed() {
    return _$checkIfSubscribedAsyncAction.run(() => super.checkIfSubscribed());
  }

  final _$initializePlayStoreAsyncAction =
      AsyncAction('_SubsController.initializePlayStore');

  @override
  Future<void> initializePlayStore() {
    return _$initializePlayStoreAsyncAction
        .run(() => super.initializePlayStore());
  }

  final _$_getProductsAsyncAction = AsyncAction('_SubsController._getProducts');

  @override
  Future<void> _getProducts() {
    return _$_getProductsAsyncAction.run(() => super._getProducts());
  }

  @override
  String toString() {
    return '''
isPurchased: ${isPurchased},
products: ${products},
isLoading: ${isLoading},
isSubscribed: ${isSubscribed}
    ''';
  }
}

import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:get/get.dart';

enum StoreItemType {
  coins,
  subscription,
}

enum StoreProductsIds {
  coins,
  subscriptions,
}

// сервис который будет обрабатывать все наши манипуляции со стором
class InAppPurchaseService {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final Stream<List<PurchaseDetails>> _storeSubscription =
      InAppPurchase.instance.purchaseStream;

  InAppPurchase get instance => _inAppPurchase;

  Stream<List<PurchaseDetails>> get getStoreSubscription {
    return _storeSubscription;
  }

  // список с айдиншиками объектов в сторе чтобы запрашивать их из стора
  static const Set<String> coins = {
    '70_coins',
    '350_coins',
    '700_coins',
    '1400_coins',
    '3500_coins',
    '7000_coins',
    '17500_coins',
  };

  Future<List<ProductDetails>> getProductsByType(StoreItemType type) async {
    final Set<String> productsIds;

    switch (type) {
      case StoreItemType.coins:
        productsIds = {'coins'};
        break;
      case StoreItemType.subscription:
        productsIds = {'subscription'};
        break;
    }

    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      return [];
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(productsIds);

    if (productDetailResponse.error != null ||
        productDetailResponse.productDetails.isEmpty) {
      return [];
    }

    return productDetailResponse.productDetails;
  }

  Future<bool> buyItemInStore(ProductDetails product) async {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    return InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<void> checkActiveSubscription() async {
    await InAppPurchase.instance.restorePurchases();
  }

  Future<void> completePurchase(PurchaseDetails purchaseDetails) async {
    await InAppPurchase.instance.completePurchase(purchaseDetails);
  }
}

class PurchaseDetailsStreamSubscription {
  final InAppPurchaseService inAppPurchaseService =
      Get.isRegistered<InAppPurchaseService>()
          ? Get.find<InAppPurchaseService>()
          : Get.put(InAppPurchaseService());
  final Function()? onPending;
  final Function(PurchaseDetails purchaseDetails,
      InAppPurchaseService inAppPurchaseService)? onPurchased;
  final Function()? onError;
  final Function()? onRestored;
  final Function()? onCanceled;

  StreamSubscription<List<PurchaseDetails>>? _streamSubscription;
  PurchaseDetailsStreamSubscription({
    this.onPending,
    this.onPurchased,
    this.onError,
    this.onRestored,
    this.onCanceled,
  });

  Future<void> init() async {
    _streamSubscription = inAppPurchaseService.getStoreSubscription.listen(
      (List<PurchaseDetails> events) {
        Future.forEach(
          events,
          (PurchaseDetails purchaseDetails) async {
            if (purchaseDetails.pendingCompletePurchase) {
              await inAppPurchaseService.completePurchase(purchaseDetails);
            }
            switch (purchaseDetails.status) {
              case PurchaseStatus.pending:
                onPending?.call();
                break;
              case PurchaseStatus.purchased:
                onPurchased?.call(purchaseDetails, inAppPurchaseService);
                break;
              case PurchaseStatus.error:
                onError?.call();
                break;
              case PurchaseStatus.restored:
                onRestored?.call();
                break;
              case PurchaseStatus.canceled:
                onCanceled?.call();
                break;
            }
          },
        );
      },
    );
  }

  void close() {
    _streamSubscription?.cancel();
  }
}

// USAGES!!

// purchaseDetailsStreamSubscription = PurchaseDetailsStreamSubscription(
//   onCanceled: closeLoader,
//   onError: closeLoader,
//   onPurchased: (PurchaseDetails purchaseDetails) async {
//     closeLoader();
//     try {
//       // тут мы проверяем наш платеж на стороне сервера передав данные о платеже ,
//       // и если все ок завершаем  покупку
//       final bool res = await transactionRepository
//           .createTransaction(purchaseDetails.verificationData.serverVerificationData);
//       if (res) {
//         await inAppPurchaseService.completePurchase(purchaseDetails);
//         await updateBalance();
//       }
//     } catch (_, __) {}
//   },
// )..init();

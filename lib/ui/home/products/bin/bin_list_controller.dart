import 'package:get/get.dart';
import 'package:my_first_app/app/routes.dart';
import 'package:my_first_app/model/product_model.dart';

class BinController extends GetxController {
  var binProduct = <Product>[];
  bool isLoading = true;

  void addToBin(Product? item) async {
    Get.toNamed(Routes.BIN);
    await Future.delayed(const Duration(seconds: 1));
    isLoading = true;
    if (item != null) binProduct.add(item);
    isLoading = false;
    update();
  }

  void deleteItem(String name) {
    binProduct.removeWhere((item) => item.title == name);
    update();
  }
}

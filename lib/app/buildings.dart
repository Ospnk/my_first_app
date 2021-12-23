import 'package:get/get.dart';
import 'package:my_first_app/ui/home/products/bin/bin_list_controller.dart';
import 'package:my_first_app/ui/home/products/drinks/drinks_list_controller.dart';
import 'package:my_first_app/ui/home/products/fruits/fruits_list_controller.dart';
import 'package:my_first_app/ui/home/products/milk/milk_list_controller.dart';
import 'package:my_first_app/ui/home/products/vegetable/vegetable_list_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<DrinksController>(() => DrinksController());
    Get.lazyPut<BinController>(() => BinController());
    Get.lazyPut<FruitsController>(() => FruitsController());
    Get.lazyPut<MilkController>(() => MilkController());
    Get.lazyPut<VegetableController>(() => VegetableController());
  }
}

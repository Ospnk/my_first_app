
import 'package:my_first_app/constants/app_image.dart';
import 'package:my_first_app/model/product_model.dart';
import 'package:get/get.dart';

class VegetableController extends GetxController {
  final vegetab = [
    Product(
        imageName: AppImages.cucumber,
        title: 'cucumber',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.tomato,
        title: 'tomato',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.potato,
        title: 'potato',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.cabbage,
        title: 'cabbage',
        price: '10',
        description: "")
  ];

}

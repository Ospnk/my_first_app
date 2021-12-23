import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/app/routes.dart';
import 'package:my_first_app/ui/home/products/bin/bin_list_controller.dart';
import 'package:my_first_app/ui/home/products/drinks/drinks_list.dart';
import 'package:my_first_app/ui/home/products/fruits/fruits_list.dart';
import 'package:my_first_app/ui/home/products/milk/milk_list.dart';
import 'package:my_first_app/ui/home/products/vegetable/vegetable_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 1;

  Widget? currentTab;
  static final List<Widget> _widgetOptions = <Widget>[
    VegetablesListWidget(),
    FruitsListWidget(),
    DrinksListWidget(),
    MilkListWidget()
  ];

  onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
    });
    switch (index) {
      case 1:
        return currentTab = VegetablesListWidget();
      case 2:
        return currentTab = Container(color: Colors.red);
      case 3:
        return currentTab = DrinksListWidget();
      default:
        return currentTab = Container(color: Colors.pinkAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our new online shop'),
        actions: <Widget>[
          GetBuilder<BinController>(
            init: BinController(),
            builder: (bC) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => Get.toNamed(Routes.BIN),
                  ),
                  bC.binProduct.isNotEmpty ? Positioned(
                    top: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                        child: Container(height: 14, width: 14,
                            child: Center(child: Text('${bC.binProduct.length}', style: TextStyle(fontSize: 11))),
                            color: Colors.deepOrange)),
                  ) : SizedBox(),
                ],
              );
            }
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              label: 'Vegetables'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining, color: Colors.red),
              label: 'Fruits'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart, color: Colors.red),
            label: 'Drinks',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.hourglass_bottom_sharp, color: Colors.red),
              label: 'Milks'),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}

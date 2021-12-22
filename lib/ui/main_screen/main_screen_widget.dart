import 'package:flutter/material.dart';
import 'package:my_first_app/ui/home/products/drinks/drinks_list.dart';
import 'package:my_first_app/ui/home/products/fruits/fruits_list_widget.dart';
import 'package:my_first_app/ui/home/products/milk/milk_list.dart';
import 'package:my_first_app/ui/home/products/vegetable/vegetable_list_widget.dart';


class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {},
        ),
        title: const Text('Our new online shop'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              Container(height: 15, width: 15, color: Colors.amber),
            ],
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

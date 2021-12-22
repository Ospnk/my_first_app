import 'package:flutter/material.dart';
import 'package:my_first_app/constants/app_image.dart';
import 'package:my_first_app/model/product_model.dart';

class FruitsListWidget extends StatefulWidget {
  FruitsListWidget({Key? key}) : super(key: key);

  @override
  _FruitsListWidgetState createState() => _FruitsListWidgetState();
}

class _FruitsListWidgetState extends State<FruitsListWidget> {
  final _fruits = [
    Product(
        imageName: AppImages.apple,
        title: 'pinapple',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.apple,
        title: 'apple',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.banana,
        title: 'Banan',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.orange,
        title: 'orange',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.apple,
        title: 'pinapple',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.apple,
        title: 'apple',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.banana,
        title: 'Banan',
        price: '10',
        description: ""),
    Product(
        imageName: AppImages.orange,
        title: 'orange',
        price: '10',
        description: "")
  ];
  var _binProduct = <Product>[];

  var _filteredProduct = <Product>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredProduct = _fruits.where((Product movie) {
        return movie.title.contains(query);
      }).toList();
    } else {
      _filteredProduct = _fruits;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredProduct.length,
          itemExtent: 160,
          itemBuilder: (BuildContext context, int index) {
            Product movie = _filteredProduct[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.price,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                        print('something');
                      },
                      onLongPress: () => _binProduct.add(movie),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withAlpha(235),
                  border: OutlineInputBorder())),
        ),
      ],
    );
  }
}

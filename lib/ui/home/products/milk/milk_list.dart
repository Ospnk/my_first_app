import 'package:flutter/material.dart';
import 'package:my_first_app/constants/app_image.dart';
import 'package:my_first_app/model/product_model.dart';

class MilkListWidget extends StatefulWidget {
  MilkListWidget({Key? key}) : super(key: key);

  @override
  _MilkListWidgetState createState() => _MilkListWidgetState();
}

class _MilkListWidgetState extends State<MilkListWidget> {
  final _milks = [
    Product(
        imageName: AppImages.milk,
        title: 'milk',
        price: '10',
        description: "cn bd v"),
    Product(
        imageName: AppImages.cream,
        title: 'cream',
        price: '10',
        description: "hbdsjkhcbf"),
    Product(
        imageName: AppImages.yougurt,
        title: 'yougurt',
        price: '10',
        description: "yougurt"),

  ];

  var _filteredProduct = <Product>[];

  final _searchController = TextEditingController();

  void _searchProducts() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredProduct = _milks.where((Product movie) {
        return movie.title.contains(query);
      }).toList();
    } else {
      _filteredProduct = _milks;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchProducts);
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
            final movie = _filteredProduct[index];
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
                        Container( height: 70, width: 70,
                            child: Image(image: AssetImage(movie.imageName))),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
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

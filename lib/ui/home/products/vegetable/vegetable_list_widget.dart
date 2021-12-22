import 'package:flutter/material.dart';
import 'package:my_first_app/data/mock_data.dart';
import 'package:my_first_app/model/product_model.dart';
import 'package:my_first_app/ui/home/products/vegetable/vegetable_list_controller.dart';

class VegetablesListWidget extends StatefulWidget {
  const VegetablesListWidget({Key? key}) : super(key: key);

  @override
  _VegetablesListWidgetState createState() => _VegetablesListWidgetState();
}

class _VegetablesListWidgetState extends State<VegetablesListWidget> {
  final _searchController = TextEditingController();
  var _dataProduct = <Product>[];
  bool isLoading = false;

  Future<bool> getData() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _dataProduct = vegetableList;
    isLoading = false;
    setState(() {});
    return isLoading;
  }

  void searchMovies(String query) {
    if (query.isNotEmpty) {
      _dataProduct = VegetableController().vegetab.where((Product movie) {
        return movie.title.contains(query);
      }).toList();
    } else {
      _dataProduct = VegetableController().vegetab;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoading
            ? const Align(
                alignment: Alignment.center, child: CircularProgressIndicator())
            : _dataProduct.isEmpty
                ? const Center(
                    child: Align(
                        alignment: Alignment.center, child: Text('data empty')),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 70),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: _dataProduct.length,
                    itemExtent: 160,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = _dataProduct[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                  Container(
                                      child: Image(
                                          image: AssetImage(movie.imageName))),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          movie.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                                          style:
                                              TextStyle(color: Colors.blueGrey),
                                        ),
                                        const SizedBox(
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
                                  const SizedBox(width: 15),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                onTap: () {
                                  print('something');
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) {
                setState(() {
                  v = _searchController.text;
                  searchMovies(v);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

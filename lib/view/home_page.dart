import 'package:classy_ecom_project/controller/api_services.dart';
import 'package:classy_ecom_project/model/all_product.dart';
import 'package:classy_ecom_project/model/all_product_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;
    final apiService = ApiRequest();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
        ),
        body: FutureBuilder(
          future: apiService.readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              print(data.error.toString());
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<AllProduct>;
              print(data.toString());
              print(items[0].toString());
              return ListView.builder(
                  itemCount: items == null ? 0 : items[0].products!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image(
                                image: NetworkImage(items[0]
                                    .products![index]
                                    .product_thambnail
                                    .toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[2]
                                          .products![index]
                                          .product_name
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(items[0]
                                        .products![index]
                                        .product_name
                                        .toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[0].products![index].selling_price.toString(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child:
                                        Text(items[0].products![index].selling_price.toString(),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child:
                                        Text(items[0].products![index].selling_price.toString(),),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

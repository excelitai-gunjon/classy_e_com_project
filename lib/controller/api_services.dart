
import 'dart:convert';
//import 'dart:html';
//import 'package:classy_ecom_project/model/all_product.dart';
import 'package:classy_ecom_project/model/all_product_model.dart';
import 'package:http/http.dart'as http;

class ApiRequest{
  // List<AllProduct> productsResponseFromJson(List<dynamic> data) {
  //   return List<AllProduct> products=data.map((e) => AllProduct.fromJson(e).toList());
  // }
      // List<AllProduct>.from(
      //     json.decode(str).map((x) => AllProduct.fromJson(x)));
  Future readJsonData()async{
    final response = await http.get(Uri.parse('https://classyecommerce.excelitaiportfolio.com/api/products'));
    if(response.statusCode==200){
      var responseList = json.decode(response.body);
      AllProductModel products=responseList.map((e) => AllProductModel.fromJson(e));
      return products;
      //   responseList.map((data) {
      //   return AllProductModel.fromJson(data);
      // }).toList();
    }else{
      throw Exception('Failed to load post');
    }
    //return ;
  }
}
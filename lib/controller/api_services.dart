
import 'dart:convert';

import 'package:classy_ecom_project/model/all_product_model.dart';
import 'package:http/http.dart'as http;

class ApiRequest{
  Future<List<AllProductModel>> readJsonData()async{
    final response = await http.get(Uri.parse('https://classyecommerce.excelitaiportfolio.com/api/products'));
    if(response.statusCode==200){
      List responseList =json.decode(response.body);
      return responseList.map((data) => AllProductModel.fromJson(data)).toList();
    }else{
      throw Exception('Failed to load post');
    }
    //return ;
  }
}
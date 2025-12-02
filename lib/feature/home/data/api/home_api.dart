import 'dart:convert';
import 'package:cartizy_app/core/common/network/result_api.dart';
import 'package:cartizy_app/core/constants/app_apis.dart';
import 'package:cartizy_app/feature/home/data/model/categories_response_dto.dart';
import 'package:cartizy_app/feature/home/data/model/product_response_dto.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  // https://api.escuelajs.co/api/v1/categories/
  Future<ResultApi<List<CategoriesResponseDto>>> getCategories() async {
    try {
      Uri url = Uri.https(AppApis.baseUrl, AppApis.categoriesUrl);
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      List<CategoriesResponseDto> categoriesList = json
          .map<CategoriesResponseDto>(
            (category) => CategoriesResponseDto.fromJson(category),
          )
          .toList();
      return SuccessApi<List<CategoriesResponseDto>>(categoriesList);
    } catch (e) {
      return ErrorApi<List<CategoriesResponseDto>>(e.toString());
    }
  }

  Future<ResultApi<List<ProductResponseDto>>> getProducts() async {
    try {
      Uri url = Uri.https(AppApis.baseUrl, AppApis.productsUrl);
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      List<ProductResponseDto> productsList = json
          .map<ProductResponseDto>(
            (product) => ProductResponseDto.fromJson(product),
          )
          .toList();
      return SuccessApi<List<ProductResponseDto>>(productsList);
    } catch (e) {
      return ErrorApi<List<ProductResponseDto>>(e.toString());
    }
  }
}

HomeApi injectableHomeApi()=>HomeApi();
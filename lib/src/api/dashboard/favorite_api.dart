import 'dart:convert';

import 'package:http/http.dart';
import 'package:places/src/core/authenticated_request.dart';
import 'package:places/src/core/constants/app_url.dart';
import 'package:places/src/model/dashboard/place_model.dart';
import 'package:places/src/model/network_response_model.dart';

class FavoriteApi {
  Future<NetworkResponseModel> getAllPlaces() async {
    try {
      final uri = Uri.parse(AppUrl.FAVORITE_LIST_URL);
      final response = await authenticatedRequest.get(uri);
      final body = jsonDecode(response.body);
      print("list of favorite $body");
      if (body["places"] == null) {
        return NetworkResponseModel(status: true, data: []);
      }
      final list = PlaceModel.allResponse(body["places"]);
      return NetworkResponseModel(status: true, data: list);
    } catch (e) {
      print("The favorite exception $e");
      return NetworkResponseModel(
          status: false, message: "$e".replaceAll("Exception:", ""));
    }
  }
}

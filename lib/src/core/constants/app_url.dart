import 'dart:convert';

import 'package:places/src/model/network_response_model.dart';

import '../authenticated_request.dart';

class AppUrl{
  static const BASE_URL = "https://places-2021-broadway.herokuapp.com/api";
  static const LOGIN_URL = "$BASE_URL/auth/login";
  static const PROFILE_URL = "$BASE_URL/users/me";
  static const REGISTER_URL = "$BASE_URL/auth/register";
  static const PLACES_LIST_URL = "$BASE_URL/places/all";
  static const FAVORITE_LIST_URL = "$BASE_URL/favorite";
  static const PLACES_URL = "$BASE_URL/places";
  static const IS_FAVORITE_URL = "$BASE_URL/favorite/isFavorite";
}


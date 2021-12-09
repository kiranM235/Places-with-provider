import 'package:geocoding/geocoding.dart';
import 'package:places/src/api/dashboard/explore_api.dart';
import 'package:places/src/core/constants/app_constants.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/dashboard/place_model.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/services/local/cache_provider.dart';

class ExploreService {
  final ExploreApi api = locator<ExploreApi>();
  final CacheProvider cacheProvider = locator<CacheProvider>();

  List<PlaceModel> _allPlaces = [];

  List<PlaceModel> get allPlaces => List.from(_allPlaces);

  Future<void> getAllPlaces() async {
    final NetworkResponseModel response = await api.getAllPlaces();
    if(response.status) {
      _allPlaces = response.data.cast<PlaceModel>();
    }
  }

  Future<NetworkResponseModel> submitData(
      String name,
      String monument,
      String description,
      String? imagePath,
      double? latitude,
      double? longitude) async {
    /// do reverse geocoding:
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude!, longitude!);
      if (placemarks.isEmpty) {
        return NetworkResponseModel(
            status: false,
            message: "Could not retrieve place info, please try again");
      }
      final place = placemarks.first;
      final streetAddress = "${place.name}, ${place.subLocality}, ${place.locality}";
      final city = place.locality;
      final street = place.street;
      print("Street address $streetAddress, $city");
      String? token = await cacheProvider.getStringValue(TOKEN_KEY);

      final response = await api.addNewPlace(
        name,
        monument,
        description,
        imagePath,
        latitude,
        longitude,
        city,
        streetAddress,
        street,
      );
    if(response.status){
      final PlaceModel place = response.data as PlaceModel;
      _allPlaces.add(place);
    }
    return response;

    } catch (e) {
      print("Errror $e");
      return NetworkResponseModel(
          status: false,
          message: "Could not retrieve place info, please try again");
    }
  }
}
import 'package:places/src/api/dashboard/explore_api.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/dashboard/place_model.dart';
import 'package:places/src/model/network_response_model.dart';

class ExploreService {
  final ExploreApi api = locator<ExploreApi>();

  List<PlaceModel> _allPlaces = [];

  List<PlaceModel> get allPlaces => List.from(_allPlaces);

  Future<void> getAllPlaces() async {
    final NetworkResponseModel response = await api.getAllPlaces();
    if(response.status) {
      _allPlaces = response.data.cast<PlaceModel>();
    }
  }
}
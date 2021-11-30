import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/dashboard/place_model.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/services/dashboard/explore_service.dart';
import 'package:places/src/viewmodels/base_view_model.dart';

class ExploreViewModel extends BaseViewModel {
  final ExploreService service = locator<ExploreService>();

  List<PlaceModel> get allPlaces => service.allPlaces;

  Future<void> getAllPlaces() async {
    setBusy(true);
    await service.getAllPlaces();
    setBusy(false);
  }
}
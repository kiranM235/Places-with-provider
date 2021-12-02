import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/services/dashboard/explore_service.dart';
import 'package:places/src/viewmodels/base_view_model.dart';

class AddNewPlaceViewModel extends BaseViewModel {
  final ExploreService service = locator<ExploreService>();
  
}
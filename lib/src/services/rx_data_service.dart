import 'package:location/location.dart';
import 'package:places/src/model/user_model.dart';
import 'package:rxdart/rxdart.dart';
class RxDataService {
  final BehaviorSubject<UserModel> _userSubject = BehaviorSubject();
  final BehaviorSubject<LocationData> _locationSubject = BehaviorSubject();
  // getters to add data
  Function(UserModel user) get addUser => _userSubject.sink.add;
  Function(LocationData loc) get addLocation => _locationSubject.sink.add;
  // getters for stream
  Stream<UserModel> get userStream => _userSubject.stream;
  Stream<LocationData> get userLocation => _locationSubject.stream;

  // getters to get the current value( last added value)
  UserModel? get currentUser => !_userSubject.hasValue ? null: _userSubject.value;
  LocationData? get currentLocation => !_locationSubject.hasValue ? null: _locationSubject.value;

  void close() {
    _userSubject.close();
    _locationSubject.close();
  }
}
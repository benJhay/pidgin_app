import 'package:pidjin_app/provider.dart';
import 'package:pidjin_app/staffModel.dart';

class Repository {
  StaffProvider staffProvider = StaffProvider();
  Future<StaffModel> fetchCurrentStaff() => staffProvider.fetchStaff();
}

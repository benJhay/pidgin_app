import 'package:pidjin_app/repository.dart';
import 'package:pidjin_app/staffModel.dart';
import 'package:rxdart/rxdart.dart';
class GitplusStaffBloc {
  
  Repository _repository = Repository();

  final _staffFetcher = PublishSubject<StaffModel>();

  Stream<StaffModel> get staff => _staffFetcher.stream;

  fetchCurrentStaff() async {
    StaffModel staffResponse = await _repository.fetchCurrentStaff();
    _staffFetcher.sink.add(staffResponse);
  }

  dispose() {
    _staffFetcher.close();
  }
}

final gitplusStaffBloc = GitplusStaffBloc();

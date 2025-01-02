// alarm_controller.dart
import 'package:get/get.dart';
import '../../../data/repositories/alarm/alarm_repository.dart';
import '../models/alarm_model.dart';

class AlarmController extends GetxController {
  final AlarmRepository _alarmRepository = AlarmRepository();
  var alarms = <AlarmModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllAlarms();
  }

  // Fetch all alarms from repository
  Future<void> fetchAllAlarms() async {
    alarms.value = await _alarmRepository.fetchAllAlarms();
  }

  // Save and set alarm
  Future<void> addAlarm(AlarmModel alarm) async {
    await _alarmRepository.saveAlarm(alarm);
    await _alarmRepository.setAlarm(alarm);
    fetchAllAlarms();  // Refresh the list after adding
  }

  // Delete alarm
  Future<void> deleteAlarm(String alarmId) async {
    await _alarmRepository.deleteAlarm(alarmId);
    fetchAllAlarms();  // Refresh the list after deleting
  }


}

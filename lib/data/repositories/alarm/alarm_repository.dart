// alarm_repository.dart
import 'package:get_storage/get_storage.dart';
import 'package:alarm/alarm.dart';
import '../../../features/shop/models/alarm_model.dart';

class AlarmRepository {
  final GetStorage _storage = GetStorage();
  static const String _alarmBoxKey = 'alarms';

  // Fetch all alarms from storage
  Future<List<AlarmModel>> fetchAllAlarms() async {
    final alarmsData = _storage.read<List>(_alarmBoxKey) ?? [];
    return alarmsData.map((e) => AlarmModel.fromMap(Map<String, dynamic>.from(e))).toList();
  }

  // Save a new alarm to storage
  Future<void> saveAlarm(AlarmModel alarm) async {
    final alarms = await fetchAllAlarms();
    alarms.add(alarm);
    await _storage.write(_alarmBoxKey, alarms.map((e) => e.toMap()).toList());
  }

  // Set an alarm using AlarmSettings
  Future<void> setAlarm(AlarmModel alarm) async {
    final alarmSettings = AlarmSettings(
      id: int.parse(alarm.id),
      dateTime: alarm.dateTime,
      assetAudioPath: 'assets/music/alarmhypercare.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      warningNotificationOnKill: true,
      androidFullScreenIntent: true,
      notificationSettings: NotificationSettings(
        title: 'Alarm Reminder',
        body: alarm.description,
        stopButton: 'Stop Alarm',
        icon: 'notification_icon',
      ),
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }

  // Delete an alarm by ID
  Future<void> deleteAlarm(String alarmId) async {
    final alarms = await fetchAllAlarms();
     Alarm.stop(int.parse(alarmId));
    alarms.removeWhere((alarm) => alarm.id == alarmId);
     _storage.write(_alarmBoxKey, alarms.map((e) => e.toMap()).toList());
  }


}

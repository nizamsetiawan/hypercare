import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypercare/app.dart';
import 'package:hypercare/data/repositories/authentication/authentication_repository.dart';
import 'package:hypercare/firebase_options.dart';


Future<void> main() async {

  ///widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  ///Get local storage
  await GetStorage.init();


  /// await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///alarm
  await Alarm.init();


  /// initialize firebase and authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //load all material design/localization/themes/bindings
  runApp(const App());
}









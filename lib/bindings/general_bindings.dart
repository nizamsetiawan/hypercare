import 'package:get/get.dart';
import 'package:hypercare/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  bool isInit = false;
  bool isDone = false;

  SplashScreenController() {
    init();
    flashScreenTimeOut();
  }

  init() async {
    final DataController dataController = Get.find();
    await dataController.initApp();
    isInit = true;
    update();
  }

  flashScreenTimeOut() async {
    await Future.delayed(const Duration(seconds: 3));
    isDone = true;
    update();
  }
}

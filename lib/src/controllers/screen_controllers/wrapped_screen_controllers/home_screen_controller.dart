import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final DataController _dataController = Get.find();

  Future<void> loadData() async {
    await _dataController.loadData();
  }
}

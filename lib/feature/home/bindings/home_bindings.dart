import 'package:get/get.dart';
import '../../../utils/core_export.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => UserController(userRepo: UserRepo(apiClient: Get.find())));
  }
}
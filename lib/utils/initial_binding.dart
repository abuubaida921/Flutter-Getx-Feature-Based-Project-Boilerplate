import 'package:get/get.dart';
import '../../../utils/core_export.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    //common controller
    Get.lazyPut(() => SplashController(splashRepo: SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
    Get.lazyPut(() => AuthController(authRepo: AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find())));
    Get.lazyPut(() => LanguageController());
    Get.lazyPut(() => UserController(userRepo: UserRepo(apiClient: Get.find())));
  }
}
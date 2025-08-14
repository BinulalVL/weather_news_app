import 'package:get/get.dart';
import '../controller/news_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Use Get.put instead of Get.lazyPut to initialize immediately
    Get.put<NewsController>(NewsController());
  }
}
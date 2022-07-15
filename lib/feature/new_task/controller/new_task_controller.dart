import 'package:get/get.dart';

class NewTaskController extends GetxController with GetTickerProviderStateMixin {
  final isSubmitDisabled = false.obs;

  disableSubmit() {
    isSubmitDisabled.value = true;
    Future.delayed(const Duration(seconds: 2), enableSubmit);
  }

  enableSubmit() {
    isSubmitDisabled.value = false;
  }
}

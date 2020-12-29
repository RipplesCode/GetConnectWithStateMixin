import 'package:get/get.dart';
import 'package:get_connect_with_state_mixin/app/modules/home/providers/user_provider.dart';
class HomeController extends GetxController with StateMixin<List<dynamic>> {


  @override
  void onInit() {
    super.onInit();
    UserProvider().getUser().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {

      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });

  }

}
import 'package:get/get.dart';

class UserController extends GetxController {
  var userName = "John Doe".obs;
  var email = "john.doe@example.com".obs;
  var phoneNumber = "07XXXXXXXX".obs;


  void updateUserName(String newName) {
    userName.value = newName;
  }
}

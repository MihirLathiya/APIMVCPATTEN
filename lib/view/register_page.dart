import 'dart:io';
import 'package:all_widget/api_routs/api_response.dart';
import 'package:all_widget/controller/register_controller.dart';
import 'package:all_widget/model/register_model.dart';
import 'package:all_widget/model/res_model.dart';
import 'package:all_widget/view/authantication/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/text.dart';
import '../../controller/password_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ShowPasswordController showPasswordController =
      Get.put(ShowPasswordController());

  TextEditingController mobile = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();
  RegisterController registerController = Get.put(RegisterController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('==========================     Done');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter FirstName';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Last Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: mobile,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Mobile';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    addData();
                  },
                  child: Ts(text: 'SignUp'),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LogInScreen());
                  },
                  child: Ts(
                    text: 'LogIn',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addData() async {
    RegisterModel _req = RegisterModel();
    _req.email = email.text.trim();
    _req.name = name.text;
    _req.mobileNo = mobile.text;
    _req.login_by = '1';
    await registerController.getUser(_req);
    if (registerController.apiResponse.status == Status.COMPLETE) {
      RegisterResponseModel response = registerController.apiResponse.data;

      print('MOBILE NO :- ${response.data!.user!.mobileNo}');
    }
  }
}

import 'package:shayplanner/components/register/register_controller.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  static const routename = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // for the appBar we're going to give it 10% of the height
      appBar: AppBar(toolbarHeight: 10.0.hp),
      // first we're going to add a container that will occupy the whole width and 90% of the height
      body: Container(
        //we're going to add some padding horizontally for the container in order
        //that the content will not stick to the edge of the screen
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        width: Get.width,
        height:
            90.0.hp, // 10 percent of the height is a lready taken by the appbar
        // inside the container we're going to use SingleScrollView so that if the screen is not
        // long enought he content will scroll
        child: SingleChildScrollView(
          // we're going to use the Column widget inside the SingleChildScrollView in order
          //to place multiple widget whithin the SingleChildScrollView Widget
          child: Column(
            children: [
              //adding so space before placing any widgets vertically
              SizedBox(height: 10.0.hp),
              //the form Widget to create our form
              Form(
                // the form key wich will help us to validate the form
                key: loginController.formKey,
                // Since the Form widget doesn't support multiple widget we will add a column widget
                // to place multiple fields
                child: Column(children: [
                  // ThemeInput is a widget that we created that will be decorated acccording to the theme
                  // of the App in order to avoid repeating code to create the same thing
                  ThemeInput(
                      theLabelText: "tr_username".tr,
                      theHintText: "tr_username".tr,
                      theTextEditingController:
                          loginController.usernameEditingController,
                      theValidation: loginController.validateUsername,
                      theContentPadding: 5.0.sp),
                  // adding some space between the two Fields
                  SizedBox(height: 2.0.hp),
                  ThemeInput(
                      theLabelText: "tr_password".tr,
                      theHintText: "tr_password".tr,
                      theTextEditingController:
                          loginController.passwordEditingController,
                      theValidation: loginController.validatePassword,
                      theContentPadding: 5.0.sp),
                  SizedBox(height: 2.0.hp),
                  // We used a container here to take the full width of the parent and align
                  // the forgot passsword text button on the right
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        loginController.goToRestPassword();
                      },
                      child: Text(
                        "tr_forgot_password".tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.hp),
                  // we will wrap the button with Obx widget making us able to check if the user has already cicked on the button
                  // so we can decide if we will continue to show the button or we will show CircularProgressIndicator
                  Obx(
                    // Here we have our ThemeButton that we created to avoid repeating the same code accross the app
                    // to render the same visual for a button
                    () => ThemeButton(
                      theContent: Text("tr_connect".tr),
                      theAction: loginController.connect,
                      theFormKey: loginController.formKey,
                      theLoadingStatus: loginController.isLoading.value,
                    ),
                  ),
                  //Some space
                  SizedBox(height: 30.0.hp),
                  // Our text button to redirect to account creation
                  TextButton(
                    onPressed: () {
                      loginController.goToRegister();
                    },
                    child: Text("tr_you_dont_have_account".tr),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

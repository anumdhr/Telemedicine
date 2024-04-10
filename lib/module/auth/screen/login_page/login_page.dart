import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seventh_sem_project/core/check_box_repo.dart';
import 'package:seventh_sem_project/core/phone_no_check_repo.dart';
import 'package:seventh_sem_project/module/auth/controller/auth-controller.dart';
import 'package:seventh_sem_project/module/common_widget/custom_button.dart';
import 'package:seventh_sem_project/module/common_widget/custom_text_field_with_bottom_border.dart';
import 'package:seventh_sem_project/module/utils/const.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _hidePassword = BehaviorSubject<bool>.seeded(true);

  final checkBox = CheckboxRepo(initialState: false);
  final numberCheckRepo = PhoneNumCheckRepo();
  final _rememberMe = BehaviorSubject<bool>.seeded(false);

  final ac = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 75, left: 30.w, right: 30.w),
            child: Column(
              children: [
                SizedBox(
                  width: 167,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Medical Assistance",
                        style: CustomStyle.textFullSansLcMediumItalic.copyWith(
                          fontSize: 15,
                          color: const Color(0xff8C8C8C),
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/medical_icon.svg",
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Register or Login",
                  style: CustomStyle.textFullSansLcBook.copyWith(
                    fontSize: 15,
                    color: const Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                sboxH32,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFieldWithBottomBorder(
                        obscureText: false,
                        // initialValue: 'anumdr3@gmail.com',
                        validator: (value) {
                          final email = ac.emailController.text;
                          RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                          if (email.isEmpty) {
                            return "Email should not be empty";
                          } else if (!emailRegex.hasMatch(email)) {
                            return "Invalid email format";
                          } else {
                            return null;
                          }
                        },

                        headingText: "Email",
                        controller: ac.emailController,
                        hintText: "abc@gmail.com",
                        attribute: "email",
                        suffixIconUrl: "assets/images/user.svg",
                        suffixIconColor: Colors.white,
                      ),
                      sboxH30,
                      StreamBuilder<bool>(
                          stream: _hidePassword.stream,
                          builder: (context, snapshot) {
                            return CustomTextFieldWithBottomBorder(
                              // initialValue: "Anumdhr12\$",
                              obscureText: snapshot.data ?? true,
                              onTapSuffixIcon: () => _hidePassword.sink.add(!snapshot.data!),
                              validator: (value) {
                                final password = ac.passwordController.text;

                                if (password == "") {
                                  return 'Please Enter the Password';
                                }
                                // else if (password.length < 6) {
                                //
                                //   return "Password length should be greater than 6";
                                // } else if (!password.contains(RegExp(r'[A-Z]'))) {
                                //
                                //   return "Password should contain at least one uppercase letter";
                                // } else if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                                //
                                //   return "Password should contain at least one special symbol";
                                // }
                                // Password is valid
                                else {
                                  return null;
                                }
                              },
                              controller: ac.passwordController,
                              headingText: "Password",
                              hintText: "Enter Password",
                              attribute: "password",
                              suffixIconUrl: "assets/images/padlock.svg",
                              suffixIconColor: Color(0xffffffff).withOpacity(0.5),
                            );
                          }),
                    ],
                  ),
                ),
                sboxH20,
                //Login Container Start
                CustomButton(
                  backgroundColor: Colors.white,
                  title: "Login",
                  onTap: () => ac.onPressedLogin(formKey),
                ),
                //Login Section End
                //Register Section Start
                sboxH24,
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      "Don't Have an account ?",
                      style: CustomStyle.textFullSansLcBook.copyWith(
                        fontSize: 14,
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                    sboxW10,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteConstant.routeRegister);

                      },
                      child: Text(
                        "Register Now",
                        style: CustomStyle.textFullSansLcMediumItalic.copyWith(
                          fontSize: 14,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),

                sboxH30,
              ],
            ),
          ),
        ),
      ),
    );

    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seventh_sem_project/module/auth/controller/auth_controller.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';
import 'package:seventh_sem_project/module/utils/validator.dart';

import '../../../common_widget/custom_button.dart';
import '../../../common_widget/custom_textfield_for_register.dart';
import '../../../common_widget/screen_witgh_background_image.dart';
import '../../../utils/custom_text_style.dart';
import '../../../utils/customized_sized_box.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final ac = Get.find<AuthController>();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWithBackgroundImage(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sboxH30,
                Text(
                  "Welcome to",
                  style: CustomStyle.textFullSansLcMedium.copyWith(
                    fontSize: 23,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                Text(
                  "Tele-Medicine",
                  style: CustomStyle.textFullSansLcBold.copyWith(
                    fontSize: 35,
                    color: const Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sboxH20,
                //Form Start
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Obx(() {
                        return Column(
                          children: [
                            sboxH25,
                            Text(
                              "Create an account",
                              style: CustomStyle.textFullSansLcMedium.copyWith(
                                fontSize: 16,
                                color: const Color(0xff000000),
                              ),
                            ),
                            sboxH20,
                            CustomTextFieldForRegister(
                              validate: ac.validateName.value,
                              onChange: (value) {
                                ac.onNameChange(name: ac.nameController.value.text.trim());
                              },
                              hintText: "Full Name",
                              controller: ac.nameController,
                              attribute: "name",
                              prefixIcon: SvgPicture.asset(
                                "assets/images/user.svg",
                                fit: BoxFit.scaleDown,
                                color: const Color(0xff8C8C8C),
                              ),
                            ),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: ac.validatePhone.value,
                              controller: ac.phoneController,
                              hintText: "Enter your mobile number",
                              prefixIcon: SvgPicture.asset("assets/images/mobile-phone.svg", fit: BoxFit.scaleDown, color: const Color(0xff8C8C8C)),
                              attribute: "phone",
                              onChange: (value) {
                                ac.onPhoneChange(phone: ac.phoneController.value.text.trim());
                              },
                            ),
                            sboxH12,
                            StreamBuilder<bool>(
                                stream: ac.hidePassword.stream,
                                builder: (context, snapshot) {
                                  return Obx(() {
                                    return CustomTextFieldForRegister(
                                      validate: ac.validatePassword.value,
                                      hintText: "Enter Password",
                                      controller: ac.passwordController,
                                      attribute: "password",
                                      prefixIcon: SvgPicture.asset("assets/images/padlock.svg", color: Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                                      obscureText: snapshot.data ?? true,
                                      suffixIcon: GestureDetector(
                                          onTap: () => ac.hidePassword.sink.add(!snapshot.data!),
                                          child: snapshot.data!
                                              ? SvgPicture.asset(
                                                  "assets/images/view.svg",
                                                  color: Color(0xff8C8C8C),
                                                  fit: BoxFit.scaleDown,
                                                )
                                              : SvgPicture.asset(
                                                  "assets/images/Hide visibility.svg",
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.scaleDown,
                                                  color: Color(0xff8C8C8C),
                                                )),
                                      onChange: (value) {
                                        ac.onPasswordChange(password: ac.passwordController.value.text.trim());
                                      },
                                    );
                                  });
                                }),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: ac.validateConfirmPassword.value,
                              hintText: "Confirm Password",
                              attribute: "confirmPassword",
                              controller: ac.confirmPassController,
                              prefixIcon: SvgPicture.asset("assets/images/padlock.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                              suffixIcon: SvgPicture.asset(
                                "assets/images/tick.svg",
                                color: const Color(0xff8C8C8C),
                                fit: BoxFit.scaleDown,
                              ),
                              obscureText: true,
                              onChange: (value) {
                                ac.onConfirmPasswordChange(
                                    password: ac.passwordController.value.text.trim(), confirmPassword: ac.confirmPassController.value.text.trim());
                              },
                            ),
                            sboxH12,

                            CustomTextFieldForRegister(
                              validate: ac.validateGender.value,


                              onChange: (value) {
                                ac.onGenderChange(gender: ac.genderController.value.text.trim());
                              },

                              readOnly: true,
                              controller: ac.genderController,
                              // readOnly: true,
                              hintText: "Gender",
                              attribute: "gender",
                              prefixIcon: SvgPicture.asset("assets/images/intersex.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                              suffixIcon: PopupMenuButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.zero,
                                onSelected: (value) {
                                  ac.genderController.text = value.toString();
                                },
                                child: SvgPicture.asset(
                                  "assets/images/Chevron_down.svg",
                                  color: const Color(0xff8C8C8C),
                                  fit: BoxFit.scaleDown,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(

                                      value: "Male",
                                      height: 40,
                                      child: Text(
                                        "Male",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "Female",
                                      height: 35,
                                      child: Text(
                                        "Female",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "Others",
                                      height: 35,
                                      child: Text(
                                        "Others ",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ];
                                },
                              ),
                            ),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: ac.validateAddress.value,
                              onChange: (value) {
                                ac.onAddressChange(address: ac.addressController.value.text.trim());
                              },
                              hintText: "Full Address",
                              controller: ac.addressController,
                              attribute: "city",
                              prefixIcon: SvgPicture.asset("assets/images/street.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                            ),

                            //terms and condition
                            sboxH30,
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  StreamBuilder<bool>(
                                      stream: ac.acceptTerm.stream,
                                      builder: (context, snapshot) {
                                        return SizedBox(
                                          height: 10.0,
                                          width: 20.0,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                            side: const BorderSide(
                                              color: Color(0xff8C8C8C),
                                            ),
                                            value: snapshot.data ?? false,
                                            onChanged: (val) => ac.acceptTerm.sink.add(val!),
                                          ),
                                        );
                                      }),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FittedBox(
                                    child: Text("I accept",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: const Color(0xff8C8C8C),
                                          fontSize: 12,
                                        )),
                                  ),
                                  sboxW6,
                                  FittedBox(
                                    child: Text("Terms and Conditions",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: const Color(0xff8C8C8C),
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            sboxH15,

                            CustomButton(
                              onTap: () {
                                Logger().d('name is ${ac.validateName.value}');
                                Logger().d('add is ${ac.validateAddress.value}');
                                Logger().d('gender is ${ac.validateGender.value}');
                                Logger().d('pw is ${ac.validatePassword.value}');
                                Logger().d('cf is ${ac.validateConfirmPassword.value}');
                                Logger().d('phone is ${ac.validatePhone.value}');
                                // Logger().d('phone is ${ac.newUserModel.value.phone}');
                                // Logger().d('pw is ${ac.newUserModel.value.password}');
                                // Logger().d('address is ${ac.newUserModel.value.address}');
                                // Logger().d('conf is ${ac.newUserModel.value.confirmPassword}');
                                Logger().d(ac.onCheckAllFieldValid());
                                if (ac.onCheckAllFieldValid() == true) {
                                  ac.newUser();

                                  Navigator.pushNamed(context, RouteConstant.routeHomePage);
                                }
                              },
                              title: "Register",
                            ),
                            sboxH20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account ?",
                                  style: CustomStyle.textFullSansLcBook.copyWith(
                                    fontSize: 14,
                                    color: const Color(0xff8C8C8C),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Login Here",
                                    style: CustomStyle.textFullSansLcMediumItalic.copyWith(
                                      fontSize: 14,
                                      color: const Color(0xff8C8C8C),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sboxH30,
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

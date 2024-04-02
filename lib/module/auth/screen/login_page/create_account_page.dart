import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/auth/controller/register_controller.dart';
import 'package:seventh_sem_project/module/common_widget/custom_button.dart';
import 'package:seventh_sem_project/module/common_widget/custom_textfield_for_register.dart';
import 'package:seventh_sem_project/module/common_widget/screen_witgh_background_image.dart';
import 'package:seventh_sem_project/module/utils/custom_text_style.dart';
import 'package:seventh_sem_project/module/utils/customized_sized_box.dart';
import 'package:seventh_sem_project/module/utils/route_constant.dart';



class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final rc = Get.find<RegisterController>();
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
                              validate: rc.validateFirstName.value,
                              onChange: (value) {
                                rc.onFirstNameChange(name: rc.firstNameController.value.text.trim());
                              },
                              hintText: "First Name",
                              controller: rc.firstNameController,
                              attribute: "first name",
                              prefixIcon: SvgPicture.asset(
                                "assets/images/user.svg",
                                fit: BoxFit.scaleDown,
                                color: const Color(0xff8C8C8C),
                              ),
                            ),

                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: rc.validateLastName.value,
                              onChange: (value) {
                                rc.onLastNameChange(name: rc.lastNameController.value.text.trim());
                              },
                              hintText: "Last Name",
                              controller: rc.lastNameController,
                              attribute: "last name",
                              prefixIcon: SvgPicture.asset("assets/images/street.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                            ),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: rc.validateEmail.value,
                              onChange: (value) {
                                rc.onEmailChange(email: rc.emailController.value.text.trim());
                              },
                              hintText: "Email",
                              controller: rc.emailController,
                              attribute: "email",
                              prefixIcon: SvgPicture.asset("assets/images/street.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                            ),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: rc.validatePhone.value,
                              controller: rc.phoneController,
                              hintText: "Enter your mobile number",
                              prefixIcon: SvgPicture.asset("assets/images/mobile-phone.svg", fit: BoxFit.scaleDown, color: const Color(0xff8C8C8C)),
                              attribute: "phone",
                              onChange: (value) {
                                rc.onPhoneChange(phone: rc.phoneController.value.text.trim());
                              },
                            ),
                            sboxH12,
                            StreamBuilder<bool>(
                                stream: rc.hidePassword.stream,
                                builder: (context, snapshot) {
                                  return Obx(() {
                                    return CustomTextFieldForRegister(
                                      validate: rc.validatePassword.value,
                                      hintText: "Enter Password",
                                      controller: rc.passwordController,
                                      attribute: "password",
                                      prefixIcon: SvgPicture.asset("assets/images/padlock.svg", color: Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                                      obscureText: snapshot.data ?? true,
                                      suffixIcon: GestureDetector(
                                          onTap: () => rc.hidePassword.sink.add(!snapshot.data!),
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
                                        rc.onPasswordChange(password: rc.passwordController.value.text.trim());
                                      },
                                    );
                                  });
                                }),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validate: rc.validateConfirmPassword.value,
                              hintText: "Confirm Password",
                              attribute: "confirmPassword",
                              controller: rc.confirmPassController,
                              prefixIcon: SvgPicture.asset("assets/images/padlock.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                              suffixIcon: SvgPicture.asset(
                                "assets/images/tick.svg",
                                color: const Color(0xff8C8C8C),
                                fit: BoxFit.scaleDown,
                              ),
                              obscureText: true,
                              onChange: (value) {
                                rc.onConfirmPasswordChange(
                                    password: rc.passwordController.value.text.trim(), confirmPassword: rc.confirmPassController.value.text.trim());
                              },
                            ),
                            sboxH12,

                            CustomTextFieldForRegister(
                              validate: rc.validateRole.value,


                              onChange: (value) {
                                rc.onRoleChange(role : rc.roleController.value.text.trim());
                              },

                              readOnly: true,
                              controller: rc.roleController,
                              // readOnly: true,
                              hintText: "Choose Role",
                              attribute: "choose role",
                              prefixIcon: SvgPicture.asset("assets/images/intersex.svg", color: const Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                              suffixIcon: PopupMenuButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.zero,
                                onSelected: (value) {
                                  rc.roleController.text = value.toString();
                                },
                                child: SvgPicture.asset(
                                  "assets/images/Chevron_down.svg",
                                  color: const Color(0xff8C8C8C),
                                  fit: BoxFit.scaleDown,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(

                                      value: "User",
                                      height: 40,
                                      child: Text(
                                        "User",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "Doctor",
                                      height: 35,
                                      child: Text(
                                        "Doctor",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),

                                  ];
                                },
                              ),
                            ),


                            //terms and condition
                            sboxH30,
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  StreamBuilder<bool>(
                                      stream: rc.acceptTerm.stream,
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
                                            onChanged: (val) => rc.acceptTerm.sink.add(val!),
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
                                if (rc.onCheckAllFieldValid() == true) {
                                  rc.newUser(context);

                                }
                                // BotToast.showText(text: 'Register in successfully.', contentColor: Colors.green);


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

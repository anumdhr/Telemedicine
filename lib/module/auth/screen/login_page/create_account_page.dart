import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seventh_sem_project/module/auth/controller/auth_controller.dart';
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
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
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
                              validator: (p0) {
                                return Validator().emptyValidator(p0);
                              },
                              hintText: "Full Name",
                              controller: ac.nameController,
                              attribute: "name",
                              prefixIcon: SvgPicture.asset(
                                "assets/images/user.svg",
                                fit: BoxFit.scaleDown,
                                color: Color(0xff8C8C8C),
                              ),
                            ),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validator: (p0) {
                                return Validator().emptyValidator(p0);
                              },
                              controller: ac.phoneController,
                              hintText: "Enter your mobile number",
                              prefixIcon: SvgPicture.asset("assets/images/mobile-phone.svg", fit: BoxFit.scaleDown, color: Color(0xff8C8C8C)),
                              attribute: "phone",
                            ),
                            sboxH12,
                            StreamBuilder<bool>(
                                stream: ac.hidePassword.stream,
                                builder: (context, snapshot) {
                                  return CustomTextFieldForRegister(
                                    validator: (p0) {
                                      return Validator().emptyValidator(p0);
                                    },
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
                                  );
                                }),
                            sboxH12,
                            CustomTextFieldForRegister(
                              validator: (p0) {
                                return Validator().emptyValidator(p0);
                              },
                              hintText: "Confirm Password",
                              attribute: "confirmPassword",
                              controller: ac.confirmPassController,
                              prefixIcon: SvgPicture.asset("assets/images/padlock.svg", color: Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                              suffixIcon: SvgPicture.asset(
                                "assets/images/tick.svg",
                                color: Color(0xff8C8C8C),
                                fit: BoxFit.scaleDown,
                              ),
                              obscureText: true,
                            ),
                            sboxH12,

                            CustomTextFieldForRegister(
                              validator: (p0) {
                                return Validator().emptyValidator(p0);
                              },
                              readOnly: true,
                              controller: ac.genderController,
                              // readOnly: true,
                              hintText: "Gender",
                              attribute: "gender",
                              prefixIcon: SvgPicture.asset("assets/images/intersex.svg", color: Color(0xff8C8C8C), fit: BoxFit.scaleDown),
                              suffixIcon: PopupMenuButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.zero,
                                onSelected: (value) {},
                                child: SvgPicture.asset(
                                  "assets/images/Chevron_down.svg",
                                  color: Color(0xff8C8C8C),
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
                              validator: (p0) {
                               return Validator().emptyValidator(p0);
                              },
                              hintText: "Full Address",
                              controller: ac.addressController,
                              attribute: "city",
                              prefixIcon: SvgPicture.asset("assets/images/street.svg", color: Color(0xff8C8C8C), fit: BoxFit.scaleDown),
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
                                          color: Color(0xff8C8C8C),
                                          fontSize: 12,
                                        )),
                                  ),
                                  sboxW6,
                                  FittedBox(
                                    child: Text("Terms and Conditions",
                                        style: CustomStyle.textFullSansLcBook.copyWith(
                                          color: Color(0xff8C8C8C),
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            sboxH15,

                            CustomButton(
                              onTap: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
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
                                    color: Color(0xff8C8C8C),
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
                                      color: Color(0xff8C8C8C),
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

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/check_box_repo.dart';
import '../../../../core/phone_no_check_repo.dart';
import '../../../common_widget/custom_button.dart';
import '../../../common_widget/custom_text_field_with_bottom_border.dart';
import '../../../common_widget/screen_witgh_background_image.dart';
import '../../../utils/custom_text_style.dart';
import '../../../utils/customized_sized_box.dart';
import '../../../utils/route_constant.dart';



class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _hidePassword = BehaviorSubject<bool>.seeded(true);

  final _formKey = GlobalKey<FormBuilderState>();
  final checkBox = CheckboxRepo(initialState: false);
  final numberCheckRepo = PhoneNumCheckRepo();
  final _rememberMe = BehaviorSubject<bool>.seeded(false);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        // BlocListener<AuthCubit, AuthState>(
        // listener: (context, authState) {
        //   if (!authState.isTokenExpires) {
        //     // Navigator.pushNamed(context, RouteConstant.routeXittoMain);
        //     // Navigator.push(MaterialPageRoute(builder: builder))
        //     //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlocProvider(
        //     //     create: (context) => HideBottomNavCubit(),
        //     //       child: XittoMain())));
        //     // }
        //   }
        // },
      ScreenWithBackgroundImage(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                            child: SvgPicture.asset("assets/images/medical_icon.svg",color: Colors.white,
                                ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Register or Login with Mobile Number",
                      style: CustomStyle.textFullSansLcBook.copyWith(
                        fontSize: 15,
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    sboxH32,
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFieldWithBottomBorder(
                            obscureText: false,
                            // initialValue: '9808217706',
                            validator: (value) {
                              final username = usernameController.text;
                              RegExp hexNum = RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}');
                              // if ((hexNum.hasMatch(username) && username.length == 10)) {
                              //   emit(state.copyWith(phone: phone));
                              // }
                              if (username == "") {
                                return " Username should not be empty";
                              } else if (username.length < 10) {
                                return "Username should have 10 digits";
                              } else if (!username.contains(RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}'))) {
                                return "Username should be number";
                              } else {
                                return null;
                              }
                            },
                            headingText: "Username",
                            controller: usernameController,
                            hintText: "Mobile Number",
                            attribute: "phone",
                            suffixIconUrl: "assets/login/user.svg",
                            suffixIconColor: Colors.white,
                            onChange: (value) {
                              numberCheckRepo.onCheckNumber(number: value);
                            },
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
                                    final password = passwordController.text;

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
                                  controller: passwordController,
                                  headingText: "Password",
                                  hintText: "Enter Password",
                                  attribute: "password",
                                  suffixIconUrl: "assets/login/padlock.svg",
                                  suffixIconColor: Color(0xffffffff).withOpacity(0.5),
                                );
                              }),
                        ],
                      ),
                    ),
                    sboxH20,
                    Row(
                      children: [
                        SizedBox(
                            height: 10.0,
                            width: 10.0,
                            child: StreamBuilder<bool>(
                              stream: _rememberMe.stream,
                              builder: (context, snapshot) {
                                return Checkbox(
                                  checkColor: Colors.black,
                                  activeColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  value: snapshot.data ?? false,
                                  onChanged: (val) {
                                    _rememberMe.sink.add(val!);
                                  },
                                );
                              },
                            )),
                        sboxW15,
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text("Remember me",
                              style: CustomStyle.textFullSansLcBook.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, RouteConstant.routeForgotPassword);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              "Forgot Password ?",
                              style: CustomStyle.textFullSansLcLightItalic.copyWith(
                                color: const Color(0xffFFFFFF),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Forgot Password Section End
                    sboxH40,
                    //Login Container Start
                    CustomButton(
                      backgroundColor: Colors.white,
                      title: "Login",
                      onTap: () async {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SocketPage(),));
                        // Loader().showLoader(context);
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, RouteConstant.routeHomePage);

                          // context.read<AuthCubit>().login(
                          //   loginData: _formKey.currentState!.value,
                          // );
                        }
                      },
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

                            // Xitto.to(routeName: RouteConstant.routeRegister);
                            // Navigator.pushNamed(context, RouteConstant.routeRegister);
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
                    sboxH40,
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, RouteConstant.routeXittoMain);
                      },
                      child: Text(
                        "Skip for Now",
                        style: CustomStyle.textFullSansLcMediumItalic.copyWith(
                          fontSize: 14,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    sboxH30,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // );
  }
}

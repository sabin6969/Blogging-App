import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_app/controller/signup_controller.dart';
import 'package:mvc_app/utils/custom_text_button.dart';
import 'package:mvc_app/utils/custom_text_form_field.dart';
import 'package:mvc_app/utils/label_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController _signupController = SignupController();
  
  @override
  void dispose() {
    _signupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 100.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.h),
                  topRight: Radius.circular(25.h),
                ),
              ),
              height: size.height * 1 - 100.h,
              width: size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _signupController.globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: LabelText(
                            data: "Create Account",
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          labelText: "Enter email",
                          isObsecure: false,
                          prefixIconData: Icons.email,
                          textEditingController:
                              _signupController.emailController,
                          validator: (value) => _signupController.validateEmail(
                              _signupController.emailController.text),
                          textInputType: TextInputType.emailAddress,
                          currentNode: _signupController.emailFocusNode,
                          nextNode: _signupController.passwordFocusNode,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ValueListenableBuilder(
                          valueListenable:
                              _signupController.isPasswordFieldHidden,
                          builder: (context, value, child) {
                            return CustomTextFormField(
                              labelText: "Define Password",
                              isObsecure: value,
                              prefixIconData: Icons.lock,
                              textEditingController:
                                  _signupController.passwordController,
                              validator: (value) => _signupController
                                  .isValidPassword(_signupController
                                      .passwordController.text),
                              textInputType: TextInputType.visiblePassword,
                              currentNode: _signupController.passwordFocusNode,
                              nextNode:
                                  _signupController.confirmPasswordFocusNode,
                              suffixIconButton: value
                                  ? IconButton(
                                      onPressed: () {
                                        _signupController
                                                .isPasswordFieldHidden.value =
                                            !_signupController
                                                .isPasswordFieldHidden.value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        _signupController
                                                .isPasswordFieldHidden.value =
                                            !_signupController
                                                .isPasswordFieldHidden.value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility_off,
                                      ),
                                    ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ValueListenableBuilder(
                          valueListenable:
                              _signupController.isConfirmPasswordFieldHidden,
                          builder: (context, value, child) {
                            return CustomTextFormField(
                              labelText: "Enter confirm password",
                              isObsecure: value,
                              prefixIconData: Icons.lock,
                              textEditingController:
                                  _signupController.confirmPasswordController,
                              validator: (value) => _signupController
                                  .isValidPassword(_signupController
                                      .confirmPasswordController.text),
                              textInputType: TextInputType.visiblePassword,
                              currentNode:
                                  _signupController.confirmPasswordFocusNode,
                              suffixIconButton: value
                                  ? IconButton(
                                      onPressed: () {
                                        _signupController
                                                .isConfirmPasswordFieldHidden
                                                .value =
                                            !_signupController
                                                .isConfirmPasswordFieldHidden
                                                .value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        _signupController
                                                .isConfirmPasswordFieldHidden
                                                .value =
                                            !_signupController
                                                .isConfirmPasswordFieldHidden
                                                .value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility_off,
                                      ),
                                    ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            _signupController.createAccount();
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabelText(
                              data: "Already have an account?",
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomTextButton(
                              name: "Login",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

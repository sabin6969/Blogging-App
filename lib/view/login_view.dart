import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_app/utils/custom_text_button.dart';
import 'package:mvc_app/utils/custom_text_form_field.dart';
import 'package:mvc_app/utils/label_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            padding: EdgeInsets.only(top: 100.h),
            child: Container(
              height: size.height * 1 - 100.h,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    25.h,
                  ),
                  topRight: Radius.circular(
                    25.h,
                  ),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: LabelText(
                          data: "Welcome Back",
                          fontSize: 28.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomTextFormField(
                        labelText: "Enter email",
                        isObsecure: false,
                        iconData: Icons.email,
                        textEditingController: _emailController,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextFormField(
                        labelText: "Enter Password",
                        isObsecure: true,
                        iconData: Icons.lock,
                        textEditingController: _passwordController,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomTextButton(
                          name: "Forgot password?",
                          onPressed: () {},
                          fontSize: 14.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
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
                            data: "Don't have an account?",
                            fontSize: 14.h,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomTextButton(
                            name: "Create account",
                            onPressed: () {},
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
          )
        ],
      ),
    );
  }
}

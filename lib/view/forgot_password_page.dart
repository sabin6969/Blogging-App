import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_app/controller/forgot_password_controller.dart';
import 'package:mvc_app/utils/custom_text_form_field.dart';
import 'package:mvc_app/utils/label_text.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final ForgotPasswordController _forgotPasswordController =
      ForgotPasswordController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final forgotPasswordControllerProvider =
        Provider.of<ForgotPasswordController>(context);
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
              height: size.height * 1 - 100.h,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    25.h,
                  ),
                  topRight: Radius.circular(
                    25.h,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: LabelText(
                            data: "Forgot Password",
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
                          textEditingController: _emailController,
                          validator: (value) => _forgotPasswordController
                              .validateEmail(_emailController.text),
                          textInputType: TextInputType.emailAddress,
                          currentNode: _emailFocusNode,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Consumer<ForgotPasswordController>(
                          builder: (context, value, child) {
                            return OutlinedButton(
                              onPressed: value.getIsLoading
                                  ? null
                                  : () {
                                      forgotPasswordControllerProvider
                                          .sendResetLink(
                                        _emailController.text,
                                        _globalKey,
                                      );
                                    },
                              child: value.getIsLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Send Reset Link",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            );
                          },
                        ),
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

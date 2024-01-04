import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_app/controller/signup_controller.dart';
import 'package:mvc_app/widgets/custom_text_button.dart';
import 'package:mvc_app/widgets/custom_text_form_field.dart';
import 'package:mvc_app/utils/label_text.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController _signupController = SignupController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isPasswordFieldHidden = ValueNotifier(true);
  final ValueNotifier<bool> _isConfirmPasswordFieldHidden = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _isConfirmPasswordFieldHidden.dispose();
    _isPasswordFieldHidden.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final signupController = Provider.of<SignupController>(context);
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
                    key: _globalKey,
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
                          textEditingController: _emailController,
                          validator: (value) => _signupController
                              .validateEmail(_emailController.text),
                          textInputType: TextInputType.emailAddress,
                          currentNode: _emailFocusNode,
                          nextNode: _passwordFocusNode,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ValueListenableBuilder(
                          valueListenable: _isPasswordFieldHidden,
                          builder: (context, value, child) {
                            return CustomTextFormField(
                              labelText: "Define Password",
                              isObsecure: value,
                              prefixIconData: Icons.lock,
                              textEditingController: _passwordController,
                              validator: (value) => _signupController
                                  .isValidPassword(_passwordController.text),
                              textInputType: TextInputType.visiblePassword,
                              currentNode: _passwordFocusNode,
                              nextNode: _confirmPasswordFocusNode,
                              suffixIconButton: value
                                  ? IconButton(
                                      onPressed: () {
                                        _isPasswordFieldHidden.value =
                                            !_isPasswordFieldHidden.value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        _isPasswordFieldHidden.value =
                                            !_isPasswordFieldHidden.value;
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
                          valueListenable: _isConfirmPasswordFieldHidden,
                          builder: (context, value, child) {
                            return CustomTextFormField(
                              labelText: "Enter confirm password",
                              isObsecure: value,
                              prefixIconData: Icons.lock,
                              textEditingController: _confirmPasswordController,
                              validator: (value) =>
                                  _signupController.isValidPassword(
                                      _confirmPasswordController.text),
                              textInputType: TextInputType.visiblePassword,
                              currentNode: _confirmPasswordFocusNode,
                              suffixIconButton: value
                                  ? IconButton(
                                      onPressed: () {
                                        _isConfirmPasswordFieldHidden.value =
                                            !_isConfirmPasswordFieldHidden
                                                .value;
                                      },
                                      icon: const Icon(
                                        Icons.visibility,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        _isConfirmPasswordFieldHidden.value =
                                            !_isConfirmPasswordFieldHidden
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
                        Consumer<SignupController>(
                          builder: (context, value, child) {
                            return OutlinedButton(
                              onPressed: signupController.getIsLoading
                                  ? null
                                  : () {
                                      signupController.createAccount(
                                        signupDetails: {
                                          "email": _emailController.text,
                                          "password": _passwordController.text,
                                          "confirmPassword":
                                              _confirmPasswordController.text,
                                        },
                                        globalKey: _globalKey,
                                      );
                                    },
                              child: signupController.getIsLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Create Account",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            );
                          },
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

import 'package:easy_hr/Core/config/page_route_name.dart';
import 'package:easy_hr/Core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/services/global_methods.dart';
import '../../../Core/widgets/custom_elevated_button.dart';
import '../../../Core/widgets/custom_text_form_field.dart';
import '../../../Core/widgets/text_builder.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';
import '../widgets/change_language.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size =  MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            EasyLoading.show();
          }else if (state is LoginSuccessState) {
            EasyLoading.dismiss();
            GlobalMethods.goRouterNavigateTOAndReplacement(
                context: context, router: PageRouteName.home);
            GlobalMethods.buildFlutterToast(
              message: "Welcome to Easy HR App",
              state: ToastStates.SUCCESS,
            );
          } else if (state is LoginErrorState) {
            EasyLoading.dismiss();
            debugPrint("🎐🎐🎐🎐🎐🎐${state.failure.statusCode}");
            debugPrint("🎐🎐${state.failure.message ?? " "}");
            GlobalMethods.buildFlutterToast(
                message: state.failure.message ?? " ", state: ToastStates.ERROR);
          }else{
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
                child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: AppColors.blackColor,
                      offset: Offset(3, 5),
                    ),
                  ],
                  color: AppColors.whiteColor,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          AppConstants.logo,
                          height: size.height * 0.25,
                          width: size.height * 0.25,
                        ),
                        CustomTextFormField(
                          controller: cubit.userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .login_username_required;
                            }
                            return null;
                          },
                          labelText: AppLocalizations.of(context)!.userName,
                          hintText: AppLocalizations.of(context)!.userNameHint,
                        ),
                        CustomTextFormField(
                          controller: cubit.passwordController,
                          onChange: (value) {
                            cubit.passwordController.text = value;
                          },
                          onSubmit: (value) {
                            cubit.passwordController.text = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .login_password_required;
                            }
                            return null;
                          },
                          isSecure: cubit.isPasswordVisible,
                          suffixIcon: cubit.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixPressed: () => cubit.changeVisibility(),
                          labelText: AppLocalizations.of(context)!.password,
                          hintText: AppLocalizations.of(context)!.passwordHint,
                        ),
                         CustomElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await cubit.userLogin();
                                  }
                                  FocusScope.of(context).unfocus();
                                },
                                width: double.infinity,
                                title: TextBuilder(
                                  AppLocalizations.of(context)!.login,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                        const ChangeLanguagesSection(),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, PageRouteName.settings);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          label: TextBuilder(
                            AppLocalizations.of(context)!.go_to_settings,
                            color: AppColors.primaryColorGrey,
                            isHeader: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}

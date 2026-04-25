import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:register_offline/cubit/auth/register/register_cubit.dart';
import 'package:register_offline/services/auth_service.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/dialog_helper.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/injector.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/auth/login_view.dart';
import 'package:register_offline/widgets/button.dart';
import 'package:register_offline/widgets/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/widgets/tap_opacity.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: BlocProvider(
        create: (context) => RegisterCubit(
          authService: locator<AuthService>()
        ),
        child: BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (previous, current) => previous.isLoading != current.isLoading 
            || previous.errorMessage != current.errorMessage 
            || previous.isSuccess != current.isSuccess,
          listener: (context, state) {
            if (state.isLoading) {
              context.hideKeyboard();
              DialogHelper.showLoading(context);
            } else {
              context.pop();
            }

            if (state.errorMessage != null) {
              DialogHelper.showSnacbar(context: context, message: state.errorMessage!);
            }

            if (state.isSuccess == true) {
              context.pushReplacement(const LoginView());
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30.0),
                          Row(
                            spacing: 8.0,
                            children: [
                              const Icon(Icons.document_scanner, size: 30.0),
                              Text(
                                "Register Offline",
                                style: headlineSmallBold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Text(
                            "Buat Akun Varifikator",
                            style: headlineMediumBold,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Lengkapi data untuk membuat akun",
                            style: bodyRegular,
                          ),
                          const SizedBox(height: 16.0),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) => previous.emailValidation != current.emailValidation,
                            builder: (context, state) {
                              return AppForm(
                                title: "Email",
                                isRequired: true,
                                controller: context.read<RegisterCubit>().emailController,
                                forceErrorText: state.emailValidation.errorMessage,
                                onChanged: (value) => context .read<RegisterCubit>().validateEmail(value),
                              );
                            },
                          ),
                          const SizedBox(height: 16.0),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) => previous.passwordValidation != current.passwordValidation,
                            builder: (context, state) {
                              return AppForm(
                                title: "Password",
                                controller: context.read<RegisterCubit>().passwordController,
                                forceErrorText:state.passwordValidation.errorMessage,
                                onChanged: (value) => context.read<RegisterCubit>().validatePassword(value),
                                isRequired: true,
                                isPassword: true,
                              );
                            },
                          ),
                          const SizedBox(height: 16.0),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) => previous.fullNameValidation != current.fullNameValidation,
                            builder: (context, state) {
                              return AppForm(
                                title: "Full Name",
                                controller: context.read<RegisterCubit>().fullNameController,
                                forceErrorText:state.fullNameValidation.errorMessage,
                                isRequired: true,
                                onChanged: (value) => context.read<RegisterCubit>().validateFullName(value),
                              );
                            },
                          ),
                          const SizedBox(height: 16.0),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) => previous.phoneNumberValidation != current.phoneNumberValidation,
                            builder: (context, state) {
                              return AppForm(
                                title: "Phone Number",
                                controller: context.read<RegisterCubit>().phoneNumberController,
                                forceErrorText:state.phoneNumberValidation.errorMessage,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) => context.read<RegisterCubit>().validatePhoneNumber(value),
                              );
                            },
                          ),
                          const SizedBox(height: 16.0),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            builder: (context, state) {
                              return AppButton.filled(
                                width: double.infinity,
                                onPressed: context.read<RegisterCubit>().register,
                                disabled: !context.read<RegisterCubit>().isValid,
                                label: "Daftar",
                              );
                            },
                          ),
                          const SizedBox(height: 16.0),
                          const Spacer(),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Sudah punya akun?",
                                style: bodyBold,
                                children: [
                                  const WidgetSpan(child: SizedBox(width: 6.0)),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: TapOpacity(
                                      onTap: () => context.pushReplacement(
                                        const LoginView(),
                                      ),
                                      child: Text(
                                        "Klik Bantuan",
                                        style: bodyRegular.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

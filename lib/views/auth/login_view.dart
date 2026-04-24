import 'package:flutter/material.dart';
import 'package:register_offline/cubit/auth/login/login_cubit.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extension/build_context_extension.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/auth/register_view.dart';
import 'package:register_offline/widgets/button.dart';
import 'package:register_offline/widgets/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/widgets/tap_opacity.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Scaffold(
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
                            Text("Register Offline", style: headlineSmallBold),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Masuk ke Akun Varifikator",
                          style: headlineMediumBold,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Masukkan email dan password untuk masuk",
                          style: bodyRegular,
                        ),
                        const SizedBox(height: 16.0),
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) => previous.emailValidation != current.emailValidation,
                          builder: (context, state) {
                            return AppForm(
                              title: "Email", 
                              isRequired: true,
                              controller: context.read<LoginCubit>().emailController,
                              forceErrorText: state.emailValidation.errorMessage,
                              onChanged: (value) => context.read<LoginCubit>().validateEmail(value),
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) => previous.passwordValidation != current.passwordValidation,
                          builder: (context, state) {
                            return AppForm(
                              title: "Password", 
                              controller: context.read<LoginCubit>().passwordController,
                              forceErrorText: state.passwordValidation.errorMessage,
                              onChanged: (value) => context.read<LoginCubit>().validatePassword(value),
                              isPassword: true,
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return AppButton.filled(
                              width: double.infinity,
                              onPressed: () {
                                
                              },
                              disabled: !context.read<LoginCubit>().isValid,
                              label: "Masuk",
                            );
                          },
                        ),
                        const Spacer(),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Belum punya akun?",
                              style: bodyBold,
                              children: [
                                const WidgetSpan(
                                  child: SizedBox(width: 6.0),
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: TapOpacity(
                                    onTap: () => context.pushReplacement(const RegisterView()),
                                    child: Text(
                                      "Klik Bantuan",
                                      style: bodyRegular.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

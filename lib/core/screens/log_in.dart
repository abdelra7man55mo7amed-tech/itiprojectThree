import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itiprojectthree/core/screens/Home.dart';
import 'package:itiprojectthree/core/screens/home_naigator.dart';
import 'package:itiprojectthree/core/widgets/app_form_fild.dart';
import 'package:itiprojectthree/core/widgets/button.dart';
import 'package:itiprojectthree/core/widgets/login_or_sign.dart';
import 'package:itiprojectthree/core/widgets/password_app_form_filed.dart';
import 'package:itiprojectthree/core/widgets/subtitle_page.dart';
import 'package:itiprojectthree/core/widgets/title_app_fom.dart';
import 'package:itiprojectthree/core/widgets/title_page.dart';
import 'package:itiprojectthree/cuibts/cubit/login_cuibt_cubit.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCuibtCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCuibtCubit, LoginCuibtState>(
          listener: (context, state) {
            if (state is LogInfailue) {
              AnimatedSnackBar.material(
                'Email or password is error',
                type: AnimatedSnackBarType.error,
                duration: const Duration(seconds: 1),
                mobilePositionSettings: const MobilePositionSettings(
                  topOnAppearance: 100,
                ),
                mobileSnackBarPosition: MobileSnackBarPosition.top,
                desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
              ).show(context);
            }
            if (state is LogInSuccess) {
              AnimatedSnackBar.material(
                'This a snackbar with info type',
                type: AnimatedSnackBarType.success,
                duration: const Duration(seconds: 1),
                mobilePositionSettings: const MobilePositionSettings(
                  topOnAppearance: 100,
                ),
                mobileSnackBarPosition: MobileSnackBarPosition.top,
                desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
              ).show(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeNaigator()));
            }
          },
          builder: (context, state) {
            final cuibt = context.read<LoginCuibtCubit>();
            if (state is LogInLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              padding: EdgeInsets.only(right: 24, left: 31),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 59),
                  TitlePage(title: "login".tr()),
                  SubtitlePage(title: "login_welcome".tr()),
                  SizedBox(height: 24),
                  TitleAppFom(title: "email_title".tr()),
                  SizedBox(height: 4),
                  AppFormFild(
                    title: "email_hint".tr(),
                    textEditingController: cuibt.email,
                    validator: (value) {},
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 16),
                  TitleAppFom(title: "pass_title".tr()),
                  SizedBox(height: 4),
                  PasswordAppFormFiled(
                    textEditingController: cuibt.password,
                    title: "pass_hint".tr(),
                    validator: (value) {},
                  ),
                  SizedBox(height: 55),
                  Button(onPressed: (){
                    context.read<LoginCuibtCubit>().login();
                  }, title: "sign".tr()),
                  SizedBox(height: 300),
                  LoginOrSign(title: "have_account".tr(), subtitle: "join".tr())
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

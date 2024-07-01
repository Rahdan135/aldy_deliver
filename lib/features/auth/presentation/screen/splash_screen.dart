import 'package:aldy/common/widgets/custom_snackbar.dart';
import 'package:aldy/features/auth/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:aldy/features/main/presntation/screen/home_screen.dart';
import 'package:aldy/genarated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
      SplashCubit()
        ..check(),
      child: Scaffold(
        body: BlocListener<SplashCubit  , SplashState>(
          listenWhen: (p,c) => p.isVpnConnected != c.isVpnConnected,
          listener: (context, state) {

            if (state.isVpnConnected!) {
              CustomSnackBar.showSnack(
                  context, "لطفا VPN خود را خاموش کنید ", Colors.red);
            } else if(!state.isVpnConnected!) {
              goToNextScreen(context);
            }

          },
          child: BlocListener<SplashCubit, SplashState>(
            listenWhen: (p,c) => p.isConnectionOn != c.isConnectionOn ,

            listener: (context, state) {
              print('in listener');
              if (!state.isConnectionOn!) {
                print('in IF listener  ##################');
                CustomSnackBar.showSnack(
                    context, "لطفا از متصل بودن اینترنت خود اطمینان حاصل فرمائید .", Colors.red);
              }

            },
            child: _buildUI(),
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    return GestureDetector(
      onTap: () {
         // CustomSnackBar.showSnack(context, "لطفا اینترنت خود را متصل کنید", Colors.red);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 200,),
          Center(

            child: Lottie.asset("assets/raw/motorcycle.json"),
          ),
          SizedBox(height: 20,),
          Image.asset(Assets.imagesLogo, width: 200, height: 200,),
        ],

      ),
    );
  }

  void goToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routName, ModalRoute.withName(HomeScreen.routName));
  }

}

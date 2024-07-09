import 'package:aldy/common/widgets/custom_snackbar.dart';
import 'package:aldy/common/widgets/dot_loading_widget.dart';
import 'package:aldy/features/auth/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:aldy/features/main/presntation/screen/home_screen.dart';
import 'package:aldy/genarated/assets.dart';
import 'package:flutter/cupertino.dart';
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
        ..checkConnection(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listenWhen: (p, c) => p.isVpnConnected != c.isVpnConnected,
          listener: (context, state) {
            if (state.isVpnConnected!) {
              CustomSnackBar.showSnack(
                  context, "لطفا VPN خود را خاموش کنید ", Colors.red);
            } else if (!state.isVpnConnected!) {
              goToNextScreen(context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Lottie.asset("assets/raw/motorcycle.json"),
              ),
              SizedBox(height: 20,),
              Image.asset(Assets.imagesLogo, width: 200, height: 200,),
              BlocConsumer<SplashCubit, SplashState>(
                listenWhen: (p, c) => p.internetEnum != c.internetEnum,
                buildWhen: (p, c) => p.internetEnum != c.internetEnum,
                listener: (context, state) {
                  if (state.internetEnum == InternetEnum.connectionOff) {
                    CustomSnackBar.showSnack(context,
                        "لطفا از متصل بودن اینترنت خود اطمینان حاصل فرمائید .",
                        Colors.red);
                  }

                  if(state.internetEnum == InternetEnum.connectionOn){
                    BlocProvider.of<SplashCubit>(context).checkVpn();
                  }

                },
                builder: (context, state) {
                  if(state.internetEnum == InternetEnum.connectionOff){
                    return SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                          onPressed: (){
                            BlocProvider.of<SplashCubit>(context).checkConnection();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          label: Text("تلاش مجدد",style: TextStyle(color: Colors.white),),
                          icon: Icon(CupertinoIcons.arrow_2_circlepath,color: Colors.white,)
                      ),
                    );
                  }

                  return DotLoadingWidget(color: Colors.blue, size: 30,);
                },
              ),
            ],

          ),
        ),
      ),
    );
  }


  void goToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routName, ModalRoute.withName(HomeScreen.routName));
  }

}

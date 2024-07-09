part of 'splash_cubit.dart';

class SplashState {
  bool? isVpnConnected;
  InternetEnum internetEnum;

    SplashState({
    required this.isVpnConnected,
    required this.internetEnum,
     });

  SplashState copyWith({
    bool? newIsVpnConnected,
    InternetEnum? newInternetEnum,
   }){
    return SplashState(
      isVpnConnected: newIsVpnConnected ?? isVpnConnected,
      internetEnum: newInternetEnum ?? internetEnum,
    );
  }
}

enum InternetEnum {
  loading,
  connectionOn,
  connectionOff
}

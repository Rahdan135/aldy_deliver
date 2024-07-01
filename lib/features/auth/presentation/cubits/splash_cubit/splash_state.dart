part of 'splash_cubit.dart';

class SplashState {
  bool? isVpnConnected;
  bool? isConnectionOn;

    SplashState({
    required this.isVpnConnected,
    required this.isConnectionOn,
     });

  SplashState copyWith({
    bool? newIsVpnConnected,
    bool? newIsConnectionOn,
   }){
    return SplashState(
      isVpnConnected: newIsVpnConnected ?? isVpnConnected,
      isConnectionOn: newIsConnectionOn ?? isConnectionOn,
    );
  }

}

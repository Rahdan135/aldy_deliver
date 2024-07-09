import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(
      isVpnConnected: null,
      internetEnum: InternetEnum.loading
  ));

  void checkConnection() async {
    emit(state.copyWith(newInternetEnum: InternetEnum.loading));

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet)){
      emit(state.copyWith(newInternetEnum: InternetEnum.connectionOn));
    }else {
      emit(state.copyWith(newInternetEnum: InternetEnum.connectionOff));
    }
  }

  void checkVpn() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    // for connection VPN
    if (connectivityResult.contains(ConnectivityResult.vpn)){
      emit(state.copyWith(newIsVpnConnected: true ));
    }
    else{
      emit(state.copyWith(newIsVpnConnected:false ));
    }
  }

}

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(isVpnConnected: null, isConnectionOn: null));

  void check() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    // for connection Internet

    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet)){
      print(" Connection True !!!!!!");
      emit(state.copyWith(newIsConnectionOn: true));

    }else {
      print(" Connection fals !!!!!!");
      emit(state.copyWith(newIsConnectionOn: false));
    }

    // for connection VPN
    if (connectivityResult.contains(ConnectivityResult.vpn)){
        emit(state.copyWith(newIsVpnConnected: true ));
    }
    else{
      emit(state.copyWith(newIsVpnConnected:false ));
    }
  }

}

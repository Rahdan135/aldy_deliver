

import 'package:aldy/common/widgets/custom_snackbar.dart';
import 'package:aldy/features/main/data/data_source/remote/main_api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class HomeScreen extends StatefulWidget {

  static const routName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final MapController controller =MapController();

  final _center = LatLng(35.72, 51.33);

  @override
  void initState() {
    // TODO: implement initState
    MainApiProvider apiProvider = MainApiProvider();
    apiProvider.callSocket();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // CustomSnackBar.showSnack(context, "Sli Heydari", Colors.greenAccent);

    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Delivery App'),
      ),
      body: Padding(padding: EdgeInsets.all(16),
        child: FlutterMap(
          mapController:controller ,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 15.0,
              maxZoom: 18
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
            ]

        ),

      ),

    );
  }
}



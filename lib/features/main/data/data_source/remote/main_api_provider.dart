

import 'package:aldy/config/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MainApiProvider {

  Future<void> callSocket() async {

    print('socket Start');
    try {
      Socket socket = io('wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
          // OptionBuilder()
          //     .setTransports(['websocket']) // for Flutter or Dart VM
          // //     .disableAutoConnect() // disable auto-connection
          // //     .setExtraHeaders({
          //   'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2LCJpc3MiOiJyb2NrZXQtc2VydmljZSIsInN1YiI6ImF1dGhlbnRpY2F0aW9uIiwiYXVkIjpbIti52YTbjCDYrduM2K_YsduMIl0sImV4cCI6MTcyMDQ2NjgxOCwibmJmIjoxNzIwMDM0ODE4LCJpYXQiOjE3MjAwMzQ4MTgsImp0aSI6IjAxOTA3YTEwLTdhZmQtN2FhZC1hZTI1LWZhNGE2ODEzYTY0MyJ9.Ph18NcKhgS9OsVnc49yb2kJNQtytkoZ7qhIp96L61ZQ'
          // }) // optional
          //     .build()
      );
       socket.onError((e){

         print("My Error :" + e.toString());

       });

      socket.onConnect((_) {
        print('Connected to the socket server');
      });

      socket.onDisconnect((_) {
        print('Disconnected from the socket server');
      });

      socket.on('message', (data) {
        print('Received message: $data');
      });

      socket.connect();
      socket.emit("body" ,
          {
            "type": 2,
            "content": {
              "request_id": 6
            }
          } );




    }catch (e){
      print(e.toString());

    }


    // final channel = WebSocketChannel.connect(
    //   Uri.parse('${Constants.baseUrl}api/v1/ws/couriers'),
    // );
    //
    //
    // await channel.ready;
    // channel.stream.listen((message) {
    //   channel.sink.add('received!');
    //   // channel.sink.close(status.goingAway);
    // });


  }

  }


import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DotLoadingWidget extends StatelessWidget {
  final double size;
  final Color color;
  const DotLoadingWidget({Key? key,this.color = Colors.white, this.size = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: LoadingAnimationWidget.inkDrop(
          size: size,
          color: color,
        ),
      ),
    );
  }
}

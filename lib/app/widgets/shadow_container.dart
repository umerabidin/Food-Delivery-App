import 'package:flutter/material.dart';
import 'package:getx_mvp/app/theme/colors.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: XColors.xGrey.withOpacity(0.5),
            offset: const Offset(0.0, 1.0),
            blurRadius: 14.0,
          ),
        ],
      ),
      child: child,
    );
  }
}

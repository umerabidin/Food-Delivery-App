import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/theme/colors.dart';

class XLoadingOverlay extends StatelessWidget {
  const XLoadingOverlay({required this.loading, required this.child, Key? key}) : super(key: key);

  final RxBool loading;
  final Widget child;

  bool get isLoading => loading.value;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isLoading,
      child: Stack(
        children: [
          child,
          Obx(() => isLoading ? _buildLoading() : Container()),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      color: XColors.xBlack[100]?.withOpacity(0.48),
      child: Center(
        child: Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: XColors.xBlack[200]?.withOpacity(0.72),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

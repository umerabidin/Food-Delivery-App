import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/theme/theme.dart';


class XDialog extends StatelessWidget {
  const XDialog({
    this.title,
    this.content,
    this.actions,
    Key? key,
  }) : super(key: key);

  final String? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.only(top: 16),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) ...[
              Text(title!, style: Get.textTheme.bodyText1Bold!.copyWith(height: 1.5)).paddingSymmetric(horizontal: 16),
              const SizedBox(height: 12),
            ],
            if (content != null) content!.paddingSymmetric(horizontal: 16),
            const SizedBox(height: 12),
            if (actions != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: actions!.map((e) => Expanded(child: e)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

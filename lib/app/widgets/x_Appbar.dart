import 'package:flutter/material.dart';
import 'package:getx_mvp/app/theme/colors.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XAppBar({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ClosableAppBar extends StatelessWidget {
  const ClosableAppBar({
    Key? key,
    required this.onClosePressed,
  }) : super(key: key);

  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          color: XColors.xBlack,
          size: 24,
        ),
        onPressed: onClosePressed,
      ),
    );
  }
}

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({
    Key? key,
    this.onBackPressed,
  }) : super(key: key);

  final VoidCallback? onBackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: XColors.xBlack,
          size: 24,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
      ),
    );
  }
}

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const TransparentAppBar({
    Key? key,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
        key: Key('keyBack'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class IconAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IconAppBar({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithLeadingAndActions extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithLeadingAndActions({
    this.leading,
    this.actions,
    required this.title,
    Key? key,
  }) : super(key: key);

  final Widget? leading;
  final List<Widget>? actions;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      leading: leading,
      actions: actions,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

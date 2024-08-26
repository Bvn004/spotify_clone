import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Appbarr extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideback;

  const Appbarr({super.key, this.title, this.hideback = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: title,
      elevation: 0,
      leading: hideback
          ? null
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.33),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                ),
              ),
            ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

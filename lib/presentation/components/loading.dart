import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class Loading extends StatelessWidget {
  final Color bgColor;

  const Loading({Key? key, this.bgColor = Style.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ?  CircularProgressIndicator(color: bgColor,)
          : CupertinoActivityIndicator(
              color: bgColor,
              radius: 12,
            ),
    );
  }
}

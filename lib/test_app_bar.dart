
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_theme.dart';
import 'default_divider.dart';

const _imageSize = 10.0;
const _imagePath = 'assets/images/icon_back.png';

class TestAppBar extends StatelessWidget with PreferredSizeWidget{
  final String appBarTitle;
  TestAppBar({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading(context),
      centerTitle: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(dividerHeight),
        child: DefaultDivider(),
      ),
      title: Text(
        appBarTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: appTheme.textStyles.appBarTitle(),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget leading(BuildContext context) {
    return Navigator.of(context).canPop()
        ? InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Image.asset(_imagePath, width: _imageSize, height: _imageSize,),
    )
        : const SizedBox();
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
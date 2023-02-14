import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const dividerHeight = 1.0;
const _dividerThickness = 1.0;

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: dividerHeight,
      thickness: _dividerThickness,
      color: Colors.grey,
    );
  }

}
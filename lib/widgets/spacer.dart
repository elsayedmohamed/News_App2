import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({Key? key, required this.space}) : super(key: key);
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
class HorizintalSpacer extends StatelessWidget {
  const HorizintalSpacer({Key? key, required this.space}) : super(key: key);
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}

import 'package:flutter/cupertino.dart';

class ShakeTransaction extends StatelessWidget {
  final Widget? child;
  final Duration? duration;
  final double? difference;
  final Axis? axis;

  const ShakeTransaction({
    Key? key,
    this.difference = 140,
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.axis = Axis.vertical,
}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TweenAnimationBuilder(
      child: child,
      curve: Curves.elasticOut,
      tween: Tween<double>(
          begin: 1,
          end: 0
      ),
      duration: duration!,
      builder: (BuildContext context, double value,Widget? child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * difference!, 0)
              : Offset(0.0, value * difference!),
          child: child,
        );
      },
    );
  }
}
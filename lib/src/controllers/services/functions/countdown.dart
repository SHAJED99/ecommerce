import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  final Duration duration;
  final Widget Function(Duration remainingTime)? builder;

  final void Function(Duration remainingTime)? onCounting;
  const CountDown({
    super.key,
    required this.duration,
    this.builder,
    this.onCounting,
  });

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Duration duration;
  late int second;

  @override
  void initState() {
    duration = widget.duration;
    second = duration.inSeconds;
    countDown();
    super.initState();
  }

  void countDown() async {
    Timer.periodic(const Duration(seconds: 1), (sec) {
      if (mounted) {
        setState(() => {second--});
        if (widget.onCounting != null) widget.onCounting!(Duration(seconds: second));
        if (second <= 0) {
          sec.cancel();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder == null) {
      return Container();
    } else {
      return widget.builder!(Duration(seconds: second));
    }
  }
}

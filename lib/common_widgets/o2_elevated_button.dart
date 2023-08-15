import 'package:flutter/material.dart';

class O2ElevatedButton extends StatelessWidget {
  const O2ElevatedButton(
      {super.key, required this.onPressed, required this.child});

  factory O2ElevatedButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
  }) = _O2ElevatedButtonWithIcon;

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: child,
    );
  }
}

class _O2ElevatedButtonWithIcon extends O2ElevatedButton {
  _O2ElevatedButtonWithIcon({
    super.key,
    required super.onPressed,
    required this.icon,
    required this.label,
  }) : super(child: _O2ElevatedButtonWithIconChild(label: label, icon: icon));

  final Widget icon;
  final Widget label;
}

class _O2ElevatedButtonWithIconChild extends StatelessWidget {
  const _O2ElevatedButtonWithIconChild({
    required this.label,
    required this.icon,
  });

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon, const SizedBox(width: 8), Flexible(child: label)],
    );
  }
}

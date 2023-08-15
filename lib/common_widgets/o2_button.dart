import 'package:flutter/material.dart';

class O2Button extends StatelessWidget {
  const O2Button({super.key, required this.onPressed, required this.child});

  factory O2Button.icon({
    Key? key,
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
  }) = _O2ButtonWithIcon;

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(width: 1.0, color: Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: child,
    );
  }
}

class _O2ButtonWithIcon extends O2Button {
  _O2ButtonWithIcon({
    super.key,
    required super.onPressed,
    required this.icon,
    required this.label,
  }) : super(child: _O2ButtonWithIconChild(label: label, icon: icon));

  final Widget icon;
  final Widget label;
}

class _O2ButtonWithIconChild extends StatelessWidget {
  const _O2ButtonWithIconChild({
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

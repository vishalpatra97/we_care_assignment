import 'package:flutter/material.dart';
import 'package:we_care/core/constants/app_roles.dart';

class AppRoleButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final AppRoleEnum roleEnum;
  final AppRoleEnum selectedEnum;
  const AppRoleButton(
    this.roleEnum, {
    super.key,
    required this.title,
    this.onPressed,
    required this.selectedEnum,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: roleEnum == selectedEnum
              ? Theme.of(context).primaryColor
              : null,
          foregroundColor: roleEnum == selectedEnum
              ? Theme.of(context).colorScheme.onPrimary
              : null,
        ),
        child: Text(title),
      ),
    );
  }
}

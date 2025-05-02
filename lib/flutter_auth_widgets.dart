// lib/widgets/shared_widgets.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AuthMode { signIn, signUp }

class AuthWidgets {
  static Widget buildAuthSwitcher(
    AuthMode authMode,
    Function(AuthMode) onSwitch,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 26, 42, 56),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _buildSwitchButton("Sign In", AuthMode.signIn, authMode, onSwitch),
          _buildSwitchButton("Sign Up", AuthMode.signUp, authMode, onSwitch),
        ],
      ),
    );
  }

  static Widget _buildSwitchButton(
    String text,
    AuthMode mode,
    AuthMode current,
    Function(AuthMode) onSwitch,
  ) {
    final isSelected = current == mode;
    return Expanded(
      child: GestureDetector(
        onTap: () => onSwitch(mode),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isSelected
                    ? const Color.fromARGB(255, 20, 49, 75)
                    : Colors.transparent,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildSocialButton(
    String assetPath,
    String text,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.white, blurRadius: 2, offset: Offset(0, 1)),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath, height: 20),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 20, 49, 75),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

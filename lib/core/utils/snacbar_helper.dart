import 'package:flutter/material.dart';

class SnackbarHelper {
  static void _showCustomSnackbar(
    BuildContext context, {
    required String message,
    required Color color,
    required IconData icon,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showSuccess(BuildContext context, String message) {
    _showCustomSnackbar(
      context,
      message: message,
      color: const Color(0xFF4CAF50),
      icon: Icons.check_circle_rounded,
    );
  }

  static void showError(BuildContext context, String message) {
    _showCustomSnackbar(
      context,
      message: message,
      color: const Color(0xFFE53935),
      icon: Icons.error_rounded,
    );
  }

  static void showWarning(BuildContext context, String message) {
    _showCustomSnackbar(
      context,
      message: message,
      color: const Color(0xFFFFA000),
      icon: Icons.warning_amber_rounded,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _showCustomSnackbar(
      context,
      message: message,
      color: const Color(0xFF2196F3),
      icon: Icons.info_rounded,
    );
  }
}

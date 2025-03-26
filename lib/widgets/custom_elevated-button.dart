import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;  // Made nullable for user input
  final Color? textColor;       // Made nullable for user input
  final bool isFullWidth;
  final double verticalPadding;
  final double borderRadius;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,       // No default value
    this.textColor,            // No default value
    this.isFullWidth = true,
    this.verticalPadding = 15,
    this.borderRadius = 10,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme colors if custom colors aren't provided
    final theme = Theme.of(context);
    final btnColor = backgroundColor ?? theme.primaryColor;
    final txtColor = textColor ?? theme.colorScheme.onPrimary;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBackgroundColor: btnColor.withOpacity(0.5),
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: txtColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
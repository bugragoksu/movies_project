import 'package:flutter/material.dart';

class ErrorTextButton extends StatelessWidget {
  const ErrorTextButton({
    Key? key,
    this.errorMessage,
    required this.onRetry,
  }) : super(key: key);
  final String? errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onRetry,
      child: Text(errorMessage ?? 'Something went wrong, try again'),
    );
  }
}

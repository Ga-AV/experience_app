import 'package:flutter/material.dart';

class SubscribeButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onPressed;

  const SubscribeButton({
    super.key,
    required this.loading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                "Subscribe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}
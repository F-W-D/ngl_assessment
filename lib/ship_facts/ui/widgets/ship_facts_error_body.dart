// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShipFactsErrorBody extends StatelessWidget {
  final VoidCallback? onPressed;
  final String errorMessage;

  const ShipFactsErrorBody({
    Key? key,
    required this.errorMessage,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 50,
          ),
          Text(errorMessage),
          const SizedBox(height: 8),
          onPressed != null
              ? ElevatedButton.icon(
                  onPressed: () {
                    onPressed?.call();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

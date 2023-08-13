import 'package:flutter/material.dart';
import 'package:nike_store/common/exeptions.dart';

class AppErrorWidget extends StatelessWidget {
  final AppExeption exeption;
  final GestureTapCallback onPressed;
  const AppErrorWidget({
    super.key,
    required this.exeption,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(exeption.message),
          ElevatedButton(
              onPressed: onPressed, child: const Text('تلاش دوباره')),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final Function() onPressed;
  final String label;
  final Duration delay;

  const LoadingButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.delay = const Duration(seconds: 1),
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(widget.delay);
        widget.onPressed();
        setState(() {
          isLoading = false;
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(20)
      ), 
      child: !isLoading 
        ? Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
        : Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(2),
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),                  
    );
  }
}
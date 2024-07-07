import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final void Function()? onPressed;
  final String label;
  final Duration delay;
  final ButtonStyle? style;

  const LoadingButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.delay = const Duration(seconds: 1), 
    this.style,
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
          if(widget.onPressed != null) {
            isLoading = true;
          }
        });
        await Future.delayed(widget.delay);
        widget.onPressed?.call();
        setState(() {
          isLoading = false;
        });
      },
      style: widget.style ?? ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium
      ), 
      child: !isLoading 
        ? Text(
          widget.label,
        )
        : Container(
          width: 22.5,
          height: 22.5,
          padding: const EdgeInsets.all(2),
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),                  
    );
  }
}
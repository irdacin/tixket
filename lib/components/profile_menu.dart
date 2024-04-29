import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData icon; 
  final bool endIcon;
  final Color? iconColor;
  final Color? textColor;

  const ProfileMenu({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
    this.endIcon = true,
    this.iconColor,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: iconColor!.withOpacity(0.1)
                ),
                child: Icon(
                  icon,
                  color: iconColor!,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
              ),
            ],
          ),
          if (endIcon) Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1)
            ),
            child : const Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 18,
            ) 
          )
        ],   
      )
    );
  }
}
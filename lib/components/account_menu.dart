import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String? titleDetail;

  const AccountMenu({
    super.key,
    required this.onPressed,
    required this.title,
    this.titleDetail,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium!.apply(color: Theme.of(context).colorScheme.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: Text(
                    titleDetail ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
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
            ),
          ],   
        ),
      )
    );
  }
}
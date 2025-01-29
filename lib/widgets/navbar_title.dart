import 'package:flutter/material.dart';
import 'package:oiot/config/config.dart';

class NavbarTile extends StatelessWidget {
  final Function onPressed;

  final String text;
  final IconData icon;
  const NavbarTile({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 9.5,
        horizontal: 7,
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Icon(
              icon,
              size: 20,
              color: textGrey,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

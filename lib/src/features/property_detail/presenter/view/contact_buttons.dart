import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';



class _ContactButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  const _ContactButton({
    required this.label,
    this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle commonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    );

    Widget buttonWidget;

    if (icon != null) {
      buttonWidget = ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: commonStyle,
      );
    } else {
      buttonWidget = ElevatedButton(
        onPressed: onPressed,
        style: commonStyle,
        child: Text(label),
      );
    }

    return Expanded(
      child: buttonWidget,
    );
  }
}

class ContactButtonsRow extends StatelessWidget {
  const ContactButtonsRow({super.key});

  void _handleButtonPress(BuildContext context) {
    context.showDeveloperContact();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _ContactButton(
          label: 'Chat',
          icon: Icons.chat_bubble_outline,
          backgroundColor: Colors.green.shade500,
          foregroundColor: Theme.of(context).colorScheme.surface,
          onPressed: () => _handleButtonPress(context),
        ),
        const SizedBox(width: 10),

        _ContactButton(
          label: 'View Phone',
          icon: Icons.phone_outlined,
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black87,
          onPressed: () => _handleButtonPress(context),
        ),
        const SizedBox(width: 10),

        _ContactButton(
          label: 'Contact Seller',
          icon: null,
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Theme.of(context).colorScheme.surface,
          onPressed: () => _handleButtonPress(context),
        ),
      ],
    );
  }
}
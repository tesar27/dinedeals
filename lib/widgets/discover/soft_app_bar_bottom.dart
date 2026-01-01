import 'package:flutter/material.dart';

extension ColorCompat on Color {
  // Fallback if Color.withValues isn't available
  Color withValues({double? alpha}) => withOpacity(alpha ?? opacity);
}

class SoftAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const SoftAppBarBottom({super.key, this.height = 12});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final c1 = scheme.shadow.withValues(alpha: 0.06);
    final c2 = scheme.shadow.withValues(alpha: 0.01);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height - 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.5, 1.0],
              colors: [c1, c2, Colors.transparent],
            ),
          ),
        ),
      ],
    );
  }
}

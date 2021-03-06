import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.isSport,
    required this.onSportPressed,
    required this.onNormalPressed,
  }) : super(key: key);

  final bool isSport;
  final VoidCallback onSportPressed;
  final VoidCallback onNormalPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.calendar_month),
              color: !isSport? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSecondary,
              onPressed: onNormalPressed,
              tooltip: 'Normal Day',
            ),
            IconButton(
              icon: const Icon(Icons.fitness_center),
              color: isSport? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSecondary,
              onPressed: onSportPressed, 
              tooltip: 'Fitness Day',
            ),
        ]),
      ),

    );
  }
}
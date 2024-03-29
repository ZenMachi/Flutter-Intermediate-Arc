import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardStory extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String description;
  final Function() onTap;

  const CardStory(
      {super.key,
      required this.onTap,
      required this.name,
      required this.description,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(name),
                ],
              ),
            ),
            Image.network(
              imgUrl,
              fit: BoxFit.cover,
              width: 100.w,
              height: 256,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  width: 100.w,
                  height: 256,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

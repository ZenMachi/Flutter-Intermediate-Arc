import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardStory extends StatelessWidget {
  final Function() onTap;
  const CardStory({super.key, required this.onTap});

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
                  'https://raw.githubusercontent.com/ZenMachi/randomrepo/main/FB_IMG_1674627184345%20(1)-min.png',
                  fit: BoxFit.cover,
                  width: 100.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8,),
                    Text("Lorem Ipsum", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Dolor Sit Amet Conseti"),
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

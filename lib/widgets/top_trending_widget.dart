import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/consts/vars.dart';
import 'package:news_app_flutter_course/widgets/spacer.dart';

import '../services/utils.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return InkWell(
      onTap: () {},
      child: Material(
     
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacer(space: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                errorWidget: Image.asset('assets/images/empty_image.png'),
                imageUrl:
                    'https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1',
                boxFit: BoxFit.fill,
                height: size.height * 0.33,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Title',
                style: smallText.copyWith(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.link),
                  ),
                  const Spacer(),
                  const Text('22-11-2022'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

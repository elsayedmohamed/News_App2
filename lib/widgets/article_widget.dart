import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/consts/vars.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/spacer.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          child: Stack(children: [
            Container(
              height: size.height * 0.10,
              width: size.height * 0.10,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: size.height * 0.10,
                width: size.height * 0.10,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                      imageUrl:
                          'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=740&t=st=1660810472~exp=1660811072~hmac=f0f4a51a270fe691680a6f15be73db9f5ce3842b19c304a926598e0c968e3ee2',
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  const HorizintalSpacer(space: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'test ' * 100 ,
                          style: smallText,
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const VerticalSpacer(space: 5),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            ' 🕥 less than a minute',
                            style: smallText,
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.link),
                              ),
                              Text(
                                '18/08/2022' * 2,
                                style: smallText,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

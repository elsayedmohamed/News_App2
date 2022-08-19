import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/consts/vars.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/article_widget.dart';
import 'package:news_app_flutter_course/widgets/drawer_widget.dart';
import 'package:news_app_flutter_course/widgets/spacer.dart';
import 'package:news_app_flutter_course/widgets/tabs.dart';
import 'package:news_app_flutter_course/widgets/top_trending_widget.dart';

import '../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  var newsType = NewsType.allNews;
  String sortBy = SortByEnum.publishedAt.name;
  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(SortByEnum.relevancy.name),
      ),
    ];

    return items;
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // bool isDarh = themeProvider.getDarkTheme;
        Size size = Utils(context).getScreenSize;


    final Color color = Utils(context).color;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: color),
          title: Text(
            'News app',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                fontSize: 20,
                letterSpacing: 0.6,
                color: color,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.search),
            ),
          ],
        ),
        drawer: const DrawerWidgwt(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  TabsWidget(
                      text: 'All news',
                      color: newsType == NewsType.allNews
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      fontSize: newsType == NewsType.allNews ? 22 : 14,
                      onTap: () {
                        if (newsType == NewsType.allNews) {
                          return;
                        }

                        setState(() {
                          newsType = NewsType.allNews;
                          print(newsType);
                        });
                      }),
                  const HorizintalSpacer(space: 10),
                  TabsWidget(
                      text: 'Top trendings',
                      color: newsType == NewsType.topTrending
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      fontSize: newsType == NewsType.topTrending ? 22 : 14,
                      onTap: () {
                        if (newsType == NewsType.topTrending) {
                          return;
                        }
                        setState(() {
                          newsType = NewsType.topTrending;
                          print(newsType);
                        });
                      }),
                ],
              ),
              newsType == NewsType.allNews
                  ? SizedBox(
                      height: kBottomNavigationBarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PaginationButtons(
                              text: 'Prev',
                              onPressed: () {
                                setState(() {
                                  if (currentPageIndex == 0) {
                                    return;
                                  }
                                  currentPageIndex -= 1;
                                });
                              }),
                          Flexible(
                            flex: 2,
                            child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentPageIndex = index;
                                        });
                                      },
                                      child: Container(
                                          color: currentPageIndex == index
                                              ? Colors.blue
                                              : Theme.of(context).cardColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text('${index + 1}')),
                                          )),
                                    ),
                                  );
                                }),
                          ),
                          PaginationButtons(
                              text: 'Next',
                              onPressed: () {
                                if (currentPageIndex == 4) {
                                  return;
                                }
                                setState(() {
                                  currentPageIndex += 1;
                                });
                              }),
                        ],
                      ),
                    )
                  : Container(),
              const VerticalSpacer(space: 10),
              newsType == NewsType.topTrending
                  ? Container()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                              value: sortBy,
                              items: dropDownItems,
                              onChanged: (value) {}),
                        ),
                      ),
                    ),

              if (newsType == NewsType.allNews)
                Expanded(
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return const ArticleWidget();
                    }),
                  ),
                ),
              if (newsType == NewsType.topTrending)
                SizedBox(
                  height:size.height*0.5,
                   child:LoadingWidget(newsType: newsType,)
                  // Swiper(
                  //   autoplayDelay: 8000,
                  //   autoplay: true,
                  //   layout:SwiperLayout.STACK,
                  //   itemWidth: size.width*0.8,
                  //   viewportFraction: 0.9,
                  //   itemCount: 5,
                  //   itemBuilder: (context, index) {
                  //     return const TopTrendingWidget();
                  //   },
                  // ),
                ),

              // newsType == NewsType.topTrending
              //     ? Container()
              //     : const LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginationButtons extends StatelessWidget {
  const PaginationButtons({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(6),
        primary: Colors.blue,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

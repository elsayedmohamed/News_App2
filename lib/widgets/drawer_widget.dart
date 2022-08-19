import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'spacer.dart';

class DrawerWidgwt extends StatefulWidget {
  const DrawerWidgwt({Key? key}) : super(key: key);

  @override
  State<DrawerWidgwt> createState() => _DrawerWidgwtState();
}

class _DrawerWidgwtState extends State<DrawerWidgwt> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const VerticalSpacer(space: 10),
                  Text(
                    'News app',
                    style: GoogleFonts.lobster(
                      textStyle:
                          const TextStyle(fontSize: 20, letterSpacing: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(space: 20),
            ListTilesWidget(
              fontSize: 20,
              icon: IconlyBold.home,
              title: 'Home',
              onTap: () {},
            ),
            ListTilesWidget(
              fontSize: 20,
              icon: IconlyBold.bookmark,
              title: 'Bookmarks',
              onTap: () {},
            ),
            const Divider(
              thickness: 5,
            ),
            SwitchListTile(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListTilesWidget extends StatelessWidget {
  ListTilesWidget({
    Key? key,
    required this.fontSize,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final double fontSize;
  final IconData icon;
  final String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
      onTap: onTap,
    );
  }
}

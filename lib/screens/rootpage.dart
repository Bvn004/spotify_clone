import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/config/appbar/appbar.dart';
import 'package:spotify_clone/helpers/isdarkmode.dart';
import 'package:spotify_clone/bloc/newsong.dart';

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarr(
        hideback: true,
        title: SvgPicture.asset(
          "assets/vectors/Vector.svg",
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 188,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset("assets/images/rootdetail.svg"),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset("assets/images/bille_root.png"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: _tabs(),
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                children: [
                  Newsongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return Container(
      // Align the TabBar to the left
      child: TabBar(
        controller: _tabController,
        labelColor: context.isDarkmode ? Colors.white : Colors.black,
        indicatorColor: Colors.green,
        dividerColor: Colors.transparent,
        // isScrollable: true,

        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: 40), // Remove any padding
        tabs: [
          Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          Text(
            'Video',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          Text(
            'Artists',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          Text(
            'Podcasts',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isFullSun = false;
  Duration duration = const Duration(seconds: 3);
//1111111111111111111
  // @override
  // void initState() {
  //   super.initState();
  //   changeMode(0);
  // }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future<void>.delayed(duration);
      changeMode(0);
    });
  }

  Future<void> changeMode(int value) async {
    //
    if (value == 0) {
      setState(() {
        isFullSun = true;
      });
    } else {
      setState(() {
        isFullSun = false;
      });
    }
  }

  //111111111111111111111111111111111111
  // Future<void> changeMode() async {
  //   await Future<void>.delayed(Duration(seconds: 3));
  //   setState(() {
  //     isFullSun = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
      if (isFullSun) const Color(0xFFFF9D80),
    ];
    var darkBgColors = const [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedContainer(
        duration: duration,
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isFullSun ? lightBgColors : darkBgColors,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              // bottom: 20,
              bottom: isFullSun ? 15 : -140,
              left: 40,
              child: SvgPicture.asset('assets/Sun.svg'),
              duration: duration,
            ),
            Positioned(
              bottom: -60,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/land_tree_light.png',
                height: height * 0.50,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: width * 0.9,
              height: 55,
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                  // indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: (value) async {
                    await changeMode(value);
                  },
                  tabs: const [
                    Tab(
                      text: 'Mornin mode',
                    ),
                    Tab(
                      text: 'Hight mode',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

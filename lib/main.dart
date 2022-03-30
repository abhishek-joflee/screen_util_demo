import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_ScreenUtil',
      home: HomePage(title: 'FlutterScreenUtil Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: Colors.black,
          tooltip: "Back",
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Text("Edit", style: TextStyle(fontSize: 20.sp)),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SystemChrome.setPreferredOrientations([
            MediaQuery.of(context).orientation == Orientation.portrait
                ? DeviceOrientation.landscapeRight
                : DeviceOrientation.portraitUp,
          ]);
          //  setState(() {});
        },
        child: const Icon(Icons.screen_rotation),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const _ProfileTile(),
            SizedBox(height: 28.h),
            const _BioTile(),
            SizedBox(height: 20.h),
            const _ProfileSettingTiles(),
            const _SettingTileDivider(),
            SizedBox(height: 22.h),
            const _AboutSettingTiles(),
            SizedBox(height: 46.h),
            const _SignOutTile(),
          ],
        ),
      ),
    );
  }
}

class _SignOutTile extends StatelessWidget {
  const _SignOutTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        children: <Widget>[
          const Icon(Icons.output_outlined, color: Colors.red),
          SizedBox(width: 20.w),
          Text(
            "Sign out",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 16.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutSettingTiles extends StatelessWidget {
  const _AboutSettingTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: const <Widget>[
          _SettingTile(icon: Icons.info_outline, name: "About Us"),
          _SettingTileDivider(),
          _SettingTile(icon: Icons.person_outline, name: "Contact Us"),
        ],
      ),
    );
  }
}

class _ProfileSettingTiles extends StatelessWidget {
  const _ProfileSettingTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: const <Widget>[
          _SettingTile(icon: Icons.notifications_none, name: "Notification"),
          _SettingTileDivider(),
          _SettingTile(icon: Icons.bookmark_outline, name: "My Saved Facts"),
          _SettingTileDivider(),
          _SettingTile(icon: Icons.bar_chart_rounded, name: "My Stats"),
          _SettingTileDivider(),
          _SettingTile(icon: Icons.favorite_border, name: "My Liked"),
          _SettingTileDivider(),
          _SettingTile(icon: Icons.lightbulb_outline, name: "My Facts"),
        ],
      ),
    );
  }
}

class _SettingTileDivider extends StatelessWidget {
  const _SettingTileDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(184, 184, 187, 0.3),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String name;
  final IconData icon;
  const _SettingTile({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 20.w),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _BioTile extends StatelessWidget {
  const _BioTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bio",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 6.h),
          const Text(
            "-Giving you an insight into the human Mind\n-Inspiring , motivating & Empowering!",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: <Widget>[
          //? image
          CircleAvatar(
            // backgroundImage: const NetworkImage(
            //   "https://upload.wikimedia.org/wikipedia/commons/6/67/Kiara_Advani_walks_for_Shyamal-Bhumika_at_India_Couture_Week_2018_Day_4_%2803%29_%28cropped%29.jpg",
            // ),
            backgroundColor: Colors.grey[350],
            radius: 37.5.r,
          ),

          //? space
          SizedBox(width: 26.w),

          //? about
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 11.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Kiara Advani",
                    style: TextStyle(
                      fontSize: 16.sp,
                      letterSpacing: 0.2,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    "advani@gmail.com",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.2,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
